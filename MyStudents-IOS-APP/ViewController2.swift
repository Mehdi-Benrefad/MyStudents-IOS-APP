//
//  ViewController2.swift
//  MyStudents-IOS-APP
//
//  Created by Mehdi Benrefad on 23/05/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class ViewControllerforinsert: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource{
    //var students = studentsInSections
    @IBOutlet weak var Picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return studentsInSections.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        for i in 0..<studentsInSections.count
        {
            if row == i {
                return String(i + 1)
            }
        }
        return String(1)
    }
}
