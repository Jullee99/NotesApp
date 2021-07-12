//
//  LoginVC.swift
//  Notepade
//
//  Created by jullegorasiya on 12/07/21.
//

import UIKit

class LoginVC: UIViewController {

    private let usernameTextField:UITextField = {
           let textfield = UITextField()
           textfield.placeholder = "Username"
           textfield.textAlignment = .center
           textfield.borderStyle = .roundedRect
          // textfield.backgroundColor = .black
           return textfield
       }()
       
       private let passwordTextField:UITextField = {
           let textfield = UITextField()
           textfield.placeholder = "Password"
           textfield.textAlignment = .center
           textfield.borderStyle = .roundedRect
           //textfield.backgroundColor = .black
           textfield.isSecureTextEntry = true
           return textfield
       }()
       
       private let mybutton:UIButton = {
           let button = UIButton()
           button.setTitle("Login", for: .normal)
           button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
           button.backgroundColor = .black
           button.layer.cornerRadius = 6
        return button
       }()
       
           
    override func viewDidLoad() {
        super.viewDidLoad()
               view.backgroundColor = .systemBackground
               view.addSubview(usernameTextField)
               view.addSubview(passwordTextField)
               view.addSubview(mybutton)
    }
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
        usernameTextField.frame = CGRect(x: 20, y: 200, width:view.width-40, height: 40)
        passwordTextField.frame = CGRect(x: 20, y: usernameTextField.bottom+5, width: view.width - 40, height: 40)
        mybutton.frame = CGRect(x: 20, y: passwordTextField.bottom+10, width: view.width - 40, height: 40)
          
          
      }
      
      let username = "Admin"
      let password = "admin"
      @objc func loginTapped(){
              if username == usernameTextField.text! && password == passwordTextField.text! {
                  UserDefaults.standard.set(usernameTextField.text!, forKey: "email")
                  let vc = FileVC()
                  navigationController?.pushViewController(vc, animated: true)
              } else {
                  let alert = UIAlertController(title: "Alert!", message: "Email and Password didn't match", preferredStyle: .alert)
                  let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                  alert.addAction(ok)
                  present(alert, animated: true, completion: nil)
              }
          }
}
