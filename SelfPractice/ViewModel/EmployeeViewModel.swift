//
//  EmployeeViewModel.swift
//  SelfPractice
//
//  Created by Lingam on 04/09/24.
//

import Foundation
import UIKit

class EmployeeViewModel{
    
    var employees = [EmployeeDetailData]()
    
    func fetchEmployees(completion: @escaping () -> Void) {
        guard let url = URL(string: "https://api.restful-api.dev/objects") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
               print("Error: \(error.localizedDescription)")
               return
            }
            
            guard let data = data else {
               print("No data received")
               return
            }

            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    let fetchedEmployees = jsonObject.compactMap { dict -> EmployeeDetailData? in
                        guard let name = dict["name"] as? String,
                              let id = dict["id"] as? String,
                              let data = dict["data"] as? [String: Any],
                              let color = data["color"] as? String else { return nil }
                        return EmployeeDetailData(name: name, id: id, color: color)
                    }
                    DispatchQueue.main.async {
                        self.employees = fetchedEmployees
                        completion()
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
