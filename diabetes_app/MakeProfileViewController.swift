//
//  MakeProfileViewController.swift
//  diabetes_app
//
//  Created by Pratham on 12/09/24.
//

import UIKit

class MakeProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pickerData = ["Type 1", "Type 2", "Prediabetes", "Gestational Diabetes",]
        self.picker.delegate = self
                self.picker.dataSource = self
        
           }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    

    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = [String]()
    
   
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


