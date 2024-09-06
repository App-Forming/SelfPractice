//
//  LoginViewController.swift
//  SelfPractice
//
//  Created by Lingam on 29/08/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpField()
    }
    

    @IBAction func submitBtnAction(_ sender: UIButton) {
        
        guard let username = userNameTF.text, !username.isEmpty,
              let password = passwordTF.text, !password.isEmpty else {
            showAlert(message: "Please enter both username and password.")
            return
        }
        
        let userdetail = User(userName: username, password: password)
        let result = authentication(user: userdetail)
        
        if result.isSuccess{
            print("go to next view controller")
        }else{
            print("login error")
        }
    }
    
    
    private func authentication(user:User) -> LoginStatus{
        if user.userName == "user" && user.password == "pass"{
            return LoginStatus(isSuccess: true, isFailure: "nil")
        }else{
            return LoginStatus(isSuccess: false, isFailure: "credential error")
        }
    }
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

extension LoginViewController:UITextFieldDelegate{
    
    func setUpField(){
        self.userNameTF.delegate = self
        self.passwordTF.delegate = self
        self.submitBtn.layer.cornerRadius = 10
        self.submitBtn.clipsToBounds = true
    }
}
