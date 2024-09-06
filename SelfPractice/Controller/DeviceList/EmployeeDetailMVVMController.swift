//
//  EmployeeDetailMVVMController.swift
//  SelfPractice
//
//  Created by Lingam on 04/09/24.
//

import UIKit

class EmployeeDetailMVVMController: UIViewController {
    @IBOutlet weak var listView: UITableView!
    private var employeesVModel = EmployeeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableview()
        self.bindViewModel()
    }
    
    func setUpTableview(){
        self.title = "Device List with MVVM"
        self.listView.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "DataTableViewCell")
        self.listView.delegate = self
        self.listView.dataSource = self
        self.listView.estimatedRowHeight = 999
        self.listView.rowHeight = UITableView.automaticDimension
    }
    
    private func bindViewModel() {
           employeesVModel.fetchEmployees { [weak self] in
               guard let self = self else { return }
               self.listView.reloadData()
           }
       }


}

extension EmployeeDetailMVVMController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employeesVModel.employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell", for: indexPath) as! DataTableViewCell
        let dataDict = self.employeesVModel.employees[indexPath.row]
        cell.namelbl.text! = "Name : \(dataDict.name)"
        cell.idlbl.text! = "Id :\(dataDict.id)"
        cell.colorlbl.text! = "Color : \( dataDict.color)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

