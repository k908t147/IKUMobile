//
//  EditAssignmnetVC.swift
//  IKUMobile
//
//  Created by Keshawn Triplett on 4/22/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
// Written By: Keshawn Triplett
// Tested By: Keshawn Triplett

import UIKit
import CoreData

class EditAssignmentVC: UIViewController, UITextFieldDelegate {
    let datePickerDueDate=UIDatePicker()
    let datePickerDueTime=UIDatePicker()
    var courses=[Courses]()
    var objectLocation: Int!
    var notCourseSpecific=0;
    var assignmentLocation: Int!
    var assignments=[Assignment]()

    
    
    @IBOutlet weak var assignmentDueTime: UITextField!
    
    @IBOutlet weak var assignmentTitle: UITextField!
    
    @IBOutlet weak var assignmentDue: UITextField!
    
    
    @IBAction func SaveAssignment(_ sender: Any) {
        
        let assignment1 = assignments[assignmentLocation] as NSManagedObject
        
        if assignmentTitle.text == ""
        {
            createAlert(title: "Incomplete", message: "Missing Assignment Title")
            
        }
        else
        {
            assignment1.setValue(assignmentTitle.text, forKey: "title")
            assignment1.setValue(assignmentDue.text, forKey: "dueDate")
            assignment1.setValue(assignmentDueTime.text, forKey: "dueTime")
            DatabaseController.saveContext()
            
            navigationController?.popViewController(animated: true)

          }
    
    }
    func createAlert(title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.assignmentTitle.delegate=self
        self.assignmentDue.delegate=self
        self.assignmentDueTime.delegate=self
        dueDateDatePicker()
        dueTimeDatePicker()
        
        assignmentTitle.text=assignments[assignmentLocation].title
        assignmentDue.text=assignments[assignmentLocation].dueDate
        assignmentDueTime.text=assignments[assignmentLocation].dueTime
    
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    // func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //assignmentTitle.resignFirstResponder()
    //assignmentDue.resignFirstResponder()
    // assignmentDueTime.resignFirstResponder()
    //  return(true)
    // }
    func dueDateDatePicker()
    {
        datePickerDueDate.datePickerMode = .date
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedDueDate))
        
        toolbar.setItems([doneButton], animated: false)
        assignmentDue.inputAccessoryView=toolbar
        assignmentDue.inputView=datePickerDueDate
        
    }
    
    
    func donePressedDueDate()
    {
        let dateFormatter=DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        assignmentDue.text = dateFormatter.string(from: datePickerDueDate.date)
        
        self.view.endEditing(true)
    }
    
    func dueTimeDatePicker()
    {
        datePickerDueTime.datePickerMode = .time
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedDueTime))
        
        toolbar.setItems([doneButton], animated: false)
        assignmentDueTime.inputAccessoryView=toolbar
        assignmentDueTime.inputView=datePickerDueTime
        
    }
    
    
    func donePressedDueTime()
    {
        let dateFormatter=DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        assignmentDueTime.text = dateFormatter.string(from: datePickerDueTime.date)
        
        self.view.endEditing(true)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

