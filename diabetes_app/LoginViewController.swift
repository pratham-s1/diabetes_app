//
//  LoginViewController.swift
//  diabetes_app
//
//  Created by Pratham on 09/09/24.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
                passwordTextField.delegate = self
        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            view.addGestureRecognizer(tapGesture)
    }
    

    @IBAction func loginClicked(_ sender: UIButton) {
        guard  let email = emailTextField.text else{return}
        guard  let password = passwordTextField.text else{return}
        
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if error != nil{
                print("error")
            }
            else {
                //go to homescreen
                self.performSegue(withIdentifier: "goToNext", sender: self)
            }
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder() // Dismiss keyboard
            return true
        }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
