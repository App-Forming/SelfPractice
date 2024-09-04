//
//  MVVMLoginViewController.swift
//  SelfPractice
//
//  Created by Lingam on 03/09/24.
//

import UIKit

class MVVMLoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    private var loginModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpField()
        self.setupBindings()
    }
    

    @IBAction func submitBtnAction(_ sender: UIButton) {
       
        loginModel.authenticate {[weak self] result in
            guard let self = self else{return}
            
            if result.isSuccess {
               print("Navigate to the next screen")
                let story = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EmployeeDetailMVVMController") as! EmployeeDetailMVVMController
                self.navigationController?.pushViewController(story, animated: true)
            } else {
               self.showAlert(message: result.isFailure ?? "Login failed.")
            }
        }
    }
    
    private func setupBindings() {
          userNameTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
          passwordTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
          updateLoginButtonState()
      }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
           if textField == userNameTF {
               loginModel.user_name = textField.text ?? ""
           } else if textField == passwordTF {
               loginModel.password = textField.text ?? ""
           }
           updateLoginButtonState()
       }
    
    private func updateLoginButtonState() {
           submitBtn.isEnabled = loginModel.isLoginEnabled
       }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

extension MVVMLoginViewController:UITextFieldDelegate{
    
    func setUpField(){
        self.userNameTF.delegate = self
        self.passwordTF.delegate = self
        self.submitBtn.layer.cornerRadius = 10
        self.submitBtn.clipsToBounds = true
    }
}
