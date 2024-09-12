//
//  CreateAccountViewController.swift
//  diabetes_app
//
//  Created by Pratham on 09/09/24.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var genderTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupClicked(_ sender: UIButton) {
        guard  let email = emailTextField.text else { return }
            guard  let password = passwordTextField.text else { return }
            guard  let name = nameTextField.text else { return }
            guard  let gender = genderTextField.text else { return }
            guard  let age = ageTextField.text else { return }
            
            Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
                if let e = error {
                    print("error")
                } else {
                    // Get the newly created user
                    guard let user = firebaseResult?.user else { return }
                    
                    // Create a UserProfileChangeRequest to update the user's profile
                    let changeRequest = user.createProfileChangeRequest()
                    changeRequest.displayName = name
                    changeRequest.commitChanges { error in
                        if let e = error {
                            print("Error updating profile: \(e)")
                        } else {
                            // Save additional user details to Firebase Realtime Database or Firestore
                            let userId = user.uid
                            let userData: [String: Any] = [
                                "name": name,
                                "gender": gender,
                                "age": age
                            ]
                            
                            // Use Firebase Realtime Database
                            Database.database().reference().child("users").child(userId).setValue(userData)
                            
                            // OR use Firebase Firestore
                            // let db = Firestore.firestore()
                            // db.collection("users").document(userId).setData(userData)
                            
                            // Go to homescreen
                            self.performSegue(withIdentifier: "goToMakeProfile", sender: self)
                        }
                    }
                }
            }
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
