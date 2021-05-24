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
    var students = studentsInSections
    
    override func viewDidLoad() {
        super.viewDidLoad()
        students = studentsInSections
        studentsTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        students = studentsInSections
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? studentTableViewCell else {
            return UITableViewCell()
        }
        //let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        let student = students[indexPath.section]
        cell.configure(withIcon: "Profile", title: student[indexPath.row].firstname, subtitle: student[indexPath.row].lastname)
        //cell.textLabel?.text = student[indexPath.row].firstname
        //cell.detailTextLabel?.text = student[indexPath.row].lastname
        //cell.imageView?.image = UIImage(named: "Profile")
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "CLASSE NUMERO: \(section + 1)"
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            studentsInSections[indexPath.section].remove(at: indexPath.row)
            students = studentsInSections
            studentsTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    //edit a student
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var studentToEdit = studentsInSections[indexPath.section][indexPath.row]
        let alertToEdit = UIAlertController(title: "Edit Student", message: "Enter the new fiestname and the new lastname", preferredStyle:.alert)
        alertToEdit.addTextField()
        alertToEdit.addTextField()
        
        //recuperation
        let nom = alertToEdit.textFields![0]
        let prenom = alertToEdit.textFields![1]
        
        //remplir les champs par les anciennes valeurs
        nom.text = studentToEdit.firstname
        prenom.text = studentToEdit.lastname
        
        //on met un ecouteur sur le bouton save
        let saveButton = UIAlertAction(title: "save" , style: .default){ (action) in
            
        //on remliot le contact par les nouvelles valeurs
        studentToEdit.firstname=alertToEdit.textFields![0].text!
        studentToEdit.lastname=alertToEdit.textFields![1].text!
        
        //on enregistre les nouvelles donnees
            studentsInSections[indexPath.section][indexPath.row].firstname = studentToEdit.firstname
            studentsInSections[indexPath.section][indexPath.row].lastname = studentToEdit.lastname

            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController")
            newViewController.modalPresentationStyle = .fullScreen
            self.present(newViewController, animated: true, completion: nil)
            
        }
        
            
        //ajouter une action a l'alerte
       alertToEdit.addAction(saveButton)
       //lancer l'alerte
       self.present(alertToEdit, animated: true, completion: nil)
       
        
        }
        
       
    }
    

