//
//  AddAssignmentVC.swift
//  IKUMobile
//
//  Created by Keshawn Triplett on 4/17/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
//

import UIKit
import CoreData

class AddAssignmentVC: UIViewController, UITextFieldDelegate {
    let datePickerDueDate=UIDatePicker()
    let datePickerDueTime=UIDatePicker()
    var courses=[Courses]()
    var objectLocation: Int!
    var notCourseSpecific=0;
    var day=""
    var month=""
    
    
    @IBOutlet weak var assignmentDueTime: UITextField!
    
    @IBOutlet weak var assignmentTitle: UITextField!
    
    @IBOutlet weak var assignmentDue: UITextField!
    

    @IBAction func SaveAssignment(_ sender: Any) {
        
        let assignment:Assignment=NSEntityDescription.insertNewObject(forEntityName: "Assignment", into:DatabaseController.persistentContainer.viewContext) as! Assignment
    
        
        
        if assignmentTitle.text == ""
         {
            createAlert(title: "Incomplete", message: "Missing Assignment Title")
            
        }
        else
        {
        if(notCourseSpecific==0)
            {
            assignment.title=assignmentTitle.text
            assignment.dueDate=assignmentDue.text
            assignment.dueTime=assignmentDueTime.text
            assignment.courseName=courses[objectLocation].courseName
            //course.mutableSetValue(forKey: "assignments").add(assignment)
            DatabaseController.saveContext()
                
                
                
                
                
            //Luis Take "Assignment as paramater to function for calendar
                
            let Assignment="Assignment,"+assignmentTitle.text!+","+month+","+day
            print(Assignment)
                
            navigationController?.popViewController(animated: true)
            }
            else
                {
                    assignment.title=assignmentTitle.text
                    assignment.dueDate=assignmentDue.text
                    assignment.dueTime=assignmentDueTime.text
                    assignment.courseName="none"
                    //course.mutableSetValue(forKey: "assignments").add(assignment)
                    DatabaseController.saveContext()
                    
                    
                    
                    //Luis, take "Assignment" as the paramater to the function for the calendar
                    
                    let Assignment="Assignment,"+assignmentTitle.text!+","+month+","+day
                    print(Assignment)

                    navigationController?.popViewController(animated: true)
                    
                    
                    
                    
                    
                }
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
        
        let dateFormatterDay=DateFormatter()
        dateFormatterDay.dateFormat="dd"
        day=dateFormatterDay.string(from: datePickerDueDate.date)
        
        let dateFormatterMonth=DateFormatter()
        dateFormatterMonth.dateFormat="MM"
        month=dateFormatterMonth.string(from: datePickerDueDate.date)

        
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
