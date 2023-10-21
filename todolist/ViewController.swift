//
//  ViewController.swift
//  todolist
//
//  Created by Sanzhar Kiyassov on 17.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textfield: UITextField!
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func addtask(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        
        let taskName = textfield.text!
        
        var newTask = Taskitem()
        
        newTask.name = taskName
        
        var taskarray:[Taskitem] = []
        
        do{
            if let data = defaults.data(forKey: "taskItemArray"){
                var array = try JSONDecoder().decode([Taskitem].self, from: data)
                
                array.append(newTask)
                
                let encodedata = try JSONEncoder().encode(array)
                
                defaults.set(encodedata, forKey: "taskItemArray")
            }
            
        } catch{
            print("unable to encode \(error)")
        }
        
//        if let array = defaults.array(forKey: "taskItemArray"){
//            taskarray = array as! [Taskitem]
//
//            taskarray.append(newTask)
//
//            defaults.set(taskarray, forKey: "taskItemArray")
//        }else{
//            let array = [newTask]
//
//            defaults.set(taskarray, forKey: "taskItemArray")
//        }
        
//        var taskarray :[String] = []
//
//        if let array = defaults.array(forKey: "taskArray"){
//            taskarray = array as! [String]
//
//            taskarray.append(taskName)
//
//            defaults.set(taskarray, forKey: "taskArray")
//        }else{
//            let array = [taskName]
//
//            defaults.set(array, forKey: "taskArray")
//        }
        
        textfield.text = ""
        
        
    }


}

