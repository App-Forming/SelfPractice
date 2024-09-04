//
//  ViewController.swift
//  SelfPractice
//
//  Created by Lingam on 28/08/24.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        let obj = Animal()
        obj.legCount2
        obj.legCount3
        obj.legCount5
    }


}


extension ViewController{
    
    
    
}

// Class
class Person {

}

// Object

let man = Person()

// Properties

class PersonProperties {

//1
    var age: Int! // These are some of the properties of Person class
    var gender: String!
    var color: String!
    var maritialStatus: String!
    
//2
    init(age: Int, gender: String, color: String, maritialStatus: String) {
    }
}

// Method

func play(sport: String) {
        
 }
