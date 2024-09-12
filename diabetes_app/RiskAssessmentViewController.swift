//
//  RiskAssessmentViewController.swift
//  diabetes_app
//
//  Created by Pratham on 12/09/24.
//

//
//  RiskAssessmentViewController.swift
//  diabetes_app
//
//  Created by Pratham on 12/09/24.
//

import UIKit

class RiskAssessmentViewController: UIViewController {

    @IBOutlet weak var rbsTextField: UITextField!
    @IBOutlet weak var hb1TextField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the button action
        button.addTarget(self, action: #selector(calculateRisk), for: .touchUpInside)
    }
    
    // Function to calculate risk and display result
    @objc func calculateRisk() {
        guard let rbsText = rbsTextField.text, let rbs = Double(rbsText),
              let hb1Text = hb1TextField.text, let hb1 = Double(hb1Text) else {
            resultLabel.text = "Invalid Input"
            resultLabel.textColor = .black
            return
        }
        
        // Logic for risk assessment based on RBS and HbA1c values
        if hb1 > 7.0 || rbs > 180 {
            showRiskResult(text: "High Risk", color: .red)
        } else if hb1 > 6.0 || rbs > 140 {
            showRiskResult(text: "Moderate Risk", color: .yellow)
        } else {
            showRiskResult(text: "Low Risk", color: .green)
        }
    }
    
    // Function to display the risk result with color coding
    func showRiskResult(text: String, color: UIColor) {
        resultLabel.text = text
        resultLabel.textColor = color
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder() // Dismiss keyboard
            return true
        }

    @objc func dismissKeyboard() {
        view.endEditing(true)
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

