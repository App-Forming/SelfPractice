//
//  LoginViewModel.swift
//  SelfPractice
//
//  Created by Lingam on 03/09/24.
//

import Foundation
import UIKit

class LoginViewModel{
    
    var user_name : String = ""
    var password : String = ""
    
    var isLoginEnabled:Bool{
        return !user_name.isEmpty && !password.isEmpty
    }
    
    func authenticate(completion : @escaping(LoginStatus) -> Void){
        print("username : \(user_name) , \(password)")
        if user_name == "user" && password == "pass"{
            completion(LoginStatus(isSuccess: true, isFailure: "nil"))
        }else{
            completion(LoginStatus(isSuccess: false, isFailure: "credential err"))
        }
    }
}
