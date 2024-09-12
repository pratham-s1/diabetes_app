//
//  HomePageViewController.swift
//  diabetes_app
//
//  Created by Pratham on 12/09/24.
//

import UIKit

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func riskclicked(_ sender: Any) {
        self.performSegue(withIdentifier: "goToRiskAssess", sender: self)
    }
    
    @IBAction func profileClicked(_ sender: UIButton) {
        
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
