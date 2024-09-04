//
//  LoginModel.swift
//  SelfPractice
//
//  Created by Lingam on 03/09/24.
//

import Foundation
import UIKit


struct User{
    var userName : String?
    var password : String?
}

struct LoginStatus{
    
    var isSuccess : Bool
    var isFailure : String?
}
