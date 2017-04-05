//
//  AddCourseVCViewController.swift
//  IKUMobile
//
//  Created by Keshawn Triplett on 3/31/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
//

import UIKit
import CoreData

class AddCourseVCViewController: UIViewController, UITextFieldDelegate {
    let datePickerlecStart=UIDatePicker()
    let datePickerlecEnd=UIDatePicker()
    let datePickeroffStart=UIDatePicker()
    let datePickeroffEnd=UIDatePicker()
    @IBOutlet weak var courseName: UITextField!
    @IBOutlet weak var lecInstructor: UITextField!
    @IBOutlet weak var lecLocation: UITextField!
    
    @IBOutlet weak var lecDays: UITextField!
    @IBOutlet weak var lecStart: UITextField!
    @IBOutlet weak var lecEnd: UITextField!
    @IBOutlet weak var offLocation: UITextField!
    @IBOutlet weak var offDays: UITextField!
    @IBOutlet weak var offStart: UITextField!
    @IBOutlet weak var offEnd: UITextField!
    
    var lecStartD: NSDate?
    var lecEndD: NSDate?
    var offStartD: NSDate?
    var offEndD: NSDate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lecStartDatePicker()
        lecEndDatePicker()
       offStartDatePicker()
        offEndDatePicker()
        
        self.courseName.delegate=self
        self.lecInstructor.delegate=self
        self.lecLocation.delegate=self
        self.lecDays.delegate=self
        self.lecEnd.delegate=self
        self.offLocation.delegate=self
        self.offDays.delegate=self
        self.offStart.delegate=self
        self.offEnd.delegate=self
         self.lecStart.delegate=self
        
        

        // Do any additional setup after loading the view.
    }
    
    func lecStartDatePicker()
    {
        datePickerlecStart.datePickerMode = .time
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedlecStart1))
        
        toolbar.setItems([doneButton], animated: false)
        lecStart.inputAccessoryView=toolbar
        lecStart.inputView=datePickerlecStart
    

        
    }
    
    func donePressedlecStart1()
    {
        let dateFormatter=DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        lecStart.text = dateFormatter.string(from: datePickerlecStart.date)
       
        
        self.view.endEditing(true)
    }

    
    
    
    
    
    
    
    
    func lecEndDatePicker()
    {
        datePickerlecEnd.datePickerMode = .time
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedlecEnd))
        toolbar.setItems([doneButton], animated: false)
    
        
        lecEnd.inputAccessoryView=toolbar
        lecEnd.inputView=datePickerlecEnd
    
        
        
    }
    
    func donePressedlecEnd()
    {
        let dateFormatter=DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        lecEnd.text = dateFormatter.string(from: datePickerlecEnd.date)
     
        
        self.view.endEditing(true)
    }
    

    
    func offStartDatePicker()
    {
        datePickeroffStart.datePickerMode = .time
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedoffStart))
        toolbar.setItems([doneButton], animated: false)
    
        offStart.inputAccessoryView=toolbar
        offStart.inputView=datePickeroffStart
        
        
    }
    
    func donePressedoffStart()
    {
        let dateFormatter=DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        offStart.text = dateFormatter.string(from: datePickeroffStart.date)
        offStartD=datePickeroffStart.date as NSDate

        
        self.view.endEditing(true)
    }
    

    
    
    
    
    
    func offEndDatePicker()
    {
        datePickeroffEnd.datePickerMode = .time
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedoffEnd))
        toolbar.setItems([doneButton], animated: false)
    
        
        offEnd.inputAccessoryView=toolbar
        offEnd.inputView=datePickeroffEnd
        
        
    }
    
    func donePressedoffEnd()
    {
        let dateFormatter=DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        offEnd.text = dateFormatter.string(from: datePickeroffEnd.date)
       // offEndD=datePickeroffEnd.date as NSDate
        
        self.view.endEditing(true)
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveCourse(_ sender: Any) {
        
        
       let course:Courses=NSEntityDescription.insertNewObject(forEntityName: "Courses", into:DatabaseController.persistentContainer.viewContext) as! Courses

        
    
        
        course.courseName=courseName.text
        course.lectureInstructor=lecInstructor.text
        course.lecturLocation=lecLocation.text
        course.officeLocation=offLocation.text
        //course.lectureEnd = lecEndD
       // course.lectureStart = lecStartD
       // course.officeStart=offStartD
        //course.officeEnd=offEndD
        
        
       //Rest of Items to be saved will be added here.
        
        print("im here")
        
    //Save the new object
        DatabaseController.saveContext()
        
        
        
    }
    
    //Hide keyboard when User touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
