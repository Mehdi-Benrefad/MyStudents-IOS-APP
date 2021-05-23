//
//  ViewController.swift
//  MyStudents-IOS-APP
//
//  Created by Mehdi Benrefad on 21/05/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
   
    @IBOutlet weak var studentsTableView: UITableView!
    var students = [
        ["Mehdi","Ali","Karim","Samir","Kamal"],["Mehdi","Ali","Karim","Samir","Kamal"],["Mehdi","Ali","Karim","Samir","Kamal"],["Mehdi","Ali","Karim","Samir","Kamal"],["Mehdi","Ali","Karim","Samir","Kamal"],["Mehdi","Ali","Karim","Samir","Kamal"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        studentsTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        for i in 0..<students.count{
            if section == i {
                return students[i].count
            }
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        let student = students[indexPath.section]
        cell.textLabel?.text = student[indexPath.row]
        cell.detailTextLabel?.text = "section" + String(indexPath.section)
        
        return cell
       
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "CLASSE NUMERO: \(section + 1)"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            students[indexPath.section].remove(at: indexPath.row)
            studentsTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

