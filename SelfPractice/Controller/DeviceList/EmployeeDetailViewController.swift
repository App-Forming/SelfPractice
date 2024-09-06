//
//  EmployeeDetailViewController.swift
//  SelfPractice
//
//  Created by Lingam on 03/09/24.
//

import UIKit

class EmployeeDetailViewController: UIViewController {
    @IBOutlet weak var listView: UITableView!
    
    var employees = [EmployeeDetailData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewCell()
        self.restApiCall()
    }

    
    func registerTableViewCell(){
        self.title = "Device List with MVC"
        self.listView.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "DataTableViewCell")
        self.listView.delegate = self
        self.listView.dataSource = self
        //Height
        self.listView.estimatedRowHeight = 999
        self.listView.rowHeight = UITableView.automaticDimension
    }

}

extension EmployeeDetailViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell", for: indexPath) as! DataTableViewCell
        let dataDict = self.employees[indexPath.row]
        cell.namelbl.text! = "Name : \(dataDict.name)"
        cell.idlbl.text! = "Id :\(dataDict.id)"
        cell.colorlbl.text! = "Color : \( dataDict.color)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension EmployeeDetailViewController{
    
    func restApiCall(){
        
        
            guard let url = URL(string: "https://api.restful-api.dev/objects") else { return }
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
    
            // Create a URL session
            let session = URLSession.shared
            let task = session.dataTask(with: url) { data, response, error in
            
                if let error = error {
                   print("Error: \(error.localizedDescription)")
                   return
                }
                
                guard let data = data else {
                   print("No data received here")
                   return
                }

               // Convert the JSON data to a [String: Any] dictionary
               do {
                   if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                       let fetchedEmployees = jsonObject.compactMap { Dict -> EmployeeDetailData? in
                           guard let name = Dict["name"] as? String,
                                 let id = Dict["id"] as? String,
                                 let data = Dict["data"] as? [String: Any],
                                let color = data["color"] as? String else { return nil }
                           return EmployeeDetailData(name: name, id: id, color: color)
                       }
                       DispatchQueue.main.async {
                             self.employees = fetchedEmployees
                             self.listView.reloadData()
                         }
                   } else {
                       print("Failed to convert data to JSON dictionary")
                   }
               } catch let error {
                   print("JSON Serialization Error: \(error.localizedDescription)")
               }
        }
        task.resume()
    }
}








