//
//  Student.swift
//  MyStudents-IOS-APP
//
//  Created by Mehdi Benrefad on 23/05/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import Foundation

struct student : Codable{
    var firstname = String()
    var lastname = String()
    var section = Int()
}

var studentsInSections : [[student]] = [
    [student(firstname:"Mehdi", lastname:"Benrefad" , section:1),
     student(firstname:"Mehdi", lastname:"Benrefad" , section:1),
     student(firstname:"Mehdi", lastname:"Benrefad" , section:1),
     student(firstname:"Mehdi", lastname:"Benrefad" , section:1),
     student(firstname:"Mehdi", lastname:"Benrefad" , section:1)],
    
    [student(firstname:"Mehdi", lastname:"Benrefad" , section:2),
     student(firstname:"Mehdi", lastname:"Benrefad" , section:2),
     student(firstname:"Mehdi", lastname:"Benrefad" , section:2),
     student(firstname:"Mehdi", lastname:"Benrefad" , section:2),
     student(firstname:"Mehdi", lastname:"Benrefad" , section:2)],
    
    [student(firstname:"Mehdi", lastname:"Benrefad" , section:3),
     student(firstname:"Mehdi", lastname:"Benrefad" , section:3),
     student(firstname:"Mehdi", lastname:"Benrefad" , section:3),
     student(firstname:"Mehdi", lastname:"Benrefad" , section:3),
     student(firstname:"Mehdi", lastname:"Benrefad" , section:3)],
    
    [student(firstname:"Mehdi", lastname:"Benrefad" , section:4),
     student(firstname:"Mehdi", lastname:"Benrefad" , section:4),
     student(firstname:"Mehdi", lastname:"Benrefad" , section:4),
     student(firstname:"Mehdi", lastname:"Benrefad" , section:4),
     student(firstname:"Mehdi", lastname:"Benrefad" , section:4)]
]



var first : [String] {
    get{
        return UserDefaults.standard.object(forKey: "studentfirst")as? [String] ?? []
    }
    set{
        UserDefaults.standard.set(first , forKey: "studentfirst")
    }
}

var last : [String]  {
    get{
        return UserDefaults.standard.object(forKey: "studentlast")as? [String] ?? []
    }
    set{
        UserDefaults.standard.set(last , forKey: "studentlast")
    }
}

var section : [Int] {
    get{
        return UserDefaults.standard.object(forKey: "studentsection")as? [Int] ?? []
    }
    set{
        UserDefaults.standard.set(section , forKey: "studentsection")
    }
}
