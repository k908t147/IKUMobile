//
//  AddCourseVCViewController.swift
//  IKUMobile
//
//  Created by Keshawn Triplett on 3/31/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
// Written By: Keshawn Triplett
// Tested By: Keshawn Triplett

import UIKit
import CoreData

class AddCourseVCViewController: UIViewController, UITextFieldDelegate {
    //Time Date Pickers
    let datePickerlecStart=UIDatePicker()
    let datePickerlecEnd=UIDatePicker()
    let datePickeroffStart=UIDatePicker()
    let datePickeroffEnd=UIDatePicker()
    let datePickerlabStart=UIDatePicker()
    let datePickerlabEnd=UIDatePicker()
    
    //Text Feild Outlets 
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labInstructor: UITextField!
    @IBOutlet weak var labEnd: UITextField!
    @IBOutlet weak var labStart: UITextField!
    @IBOutlet weak var labLocation: UITextField!
    @IBOutlet weak var offEnd: UITextField!
    @IBOutlet weak var offStart: UITextField!
    @IBOutlet weak var offLocation: UITextField!
    @IBOutlet weak var lecEnd: UITextField!
    @IBOutlet weak var lecStart: UITextField!
    @IBOutlet weak var lecInstructor: UITextField!
    @IBOutlet weak var lecLocation: UITextField!
    @IBOutlet weak var courseName: UITextField!
    
    //Lecture Days Buttons
    var lecMonButton=0
    var lecTueButton=0
    var lecWedButton=0
    var lecThurButton=0
    var lecFriButton=0
    var lecDays = Array(repeating: 0, count: 5)
    
    //Office Days Button
    
    var offMonButton=0
    var offTueButton=0
    var offWedButton=0
    var offThurButton=0
    var offFriButton=0
    var offDays = Array(repeating: 0, count: 5)
    
    //Lab Days Button
    
    var labMonButton=0
    var labTueButton=0
    var labWedButton=0
    var labThurButton=0
    var labFriButton=0
    var labDays = Array(repeating: 0, count: 5)
    
    
    
    @IBAction func addNewCourse(_ sender: Any) {
       
        
        let course:Courses=NSEntityDescription.insertNewObject(forEntityName: "Courses", into:DatabaseController.persistentContainer.viewContext) as! Courses
        
        if courseName.text == ""
        {
            createAlert(title: "Incomplete", message: "Missing Course Name")
            
        }
        else
        {
        let labDaysData = NSKeyedArchiver.archivedData(withRootObject: labDays)
        let lecDaysData = NSKeyedArchiver.archivedData(withRootObject: lecDays)
        let offDaysData = NSKeyedArchiver.archivedData(withRootObject: offDays)
        course.offDays=offDaysData as NSData
        course.lecDays=lecDaysData as NSData
        course.labDays=labDaysData as NSData
        course.courseName=courseName.text
        course.lecInstructor=lecInstructor.text
        course.lecLocation=lecLocation.text
        course.offLocation=offLocation.text
        course.labInstructor=labInstructor.text
        course.labLocation=labLocation.text
        course.labStart=labStart.text
        course.labEnd=labEnd.text
        course.lecEnd = lecEnd.text
        course.lecStart=lecStart.text
        course.offStart=offStart.text
        course.offEnd=offEnd.text
            
        //Calendar Packaging
            var lecDaysString=""
            var labDaysString=""
            var offDaysString=""
            for i in lecDays
           {
            lecDaysString=lecDaysString+"\(i)"
            }
        
            for i in labDays
            {
                labDaysString=labDaysString+"\(i)"
            }
            for i in offDays
            {
                offDaysString=offDaysString+"\(i)"
            }

            
            
            
            
            
            
         //Luis take Lab, Lecture, and office as parameeters to function for calendar
            var Name = courseName.text!+" - Lecture"
            var Type = "0"
            EventHelper().addAppleEvents(Type: Type, Name: Name, Sequence: lecDaysString, Location: lecLocation.text!, StartHour: lecStart.text!, EndHour: lecEnd.text!)//Lecture
            
            Name = courseName.text!+" - Laboratory"
            EventHelper().addAppleEvents(Type: Type, Name: Name, Sequence: labDaysString, Location: labLocation.text!, StartHour: labStart.text!, EndHour: labEnd.text!)//Laboratory
            
            Name = courseName.text!+" - Office"
            EventHelper().addAppleEvents(Type: Type, Name: Name, Sequence: offDaysString, Location: offLocation.text!, StartHour: offStart.text!, EndHour: offEnd.text!)//Office
            
            
            
            
            
            
        var lecture="Lecture,"
        lecture=lecture+courseName.text!+","+lecDaysString+","+lecStart.text!+","+lecEnd.text!
        print(lecture)
        
        
        //EventHelper().addAppleEvents(InfoEvent: lecture)
        
        var lab="Lab,"
        lab=lab+courseName.text!+","+labDaysString+","+labStart.text!+","+labEnd.text!
        print(lab)
        
        var office="Office,"
        office=office+courseName.text!+","+offDaysString+","+offStart.text!+","+offEnd.text!
        print(office)
            
        
        
        //Save the new object
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
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        lecStartDatePicker()
        lecEndDatePicker()
        offStartDatePicker()
        offEndDatePicker()
        labStartDatePicker()
        labEndDatePicker()
        
    
       let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.touch))
       recognizer.numberOfTapsRequired = 1
       recognizer.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(recognizer)

        //Do any additional setup after loading the view.
    }
    
    func touch() {
        self.view.endEditing(true)
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
      
        self.view.endEditing(true)
    }
    

    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func labStartDatePicker()
    {
        datePickerlabStart.datePickerMode = .time
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedlabStart))
        toolbar.setItems([doneButton], animated: false)
        
        
        labStart.inputAccessoryView=toolbar
        labStart.inputView=datePickerlecEnd
        
    }
    
    func donePressedlabStart()
    {
        let dateFormatter=DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        labStart.text = dateFormatter.string(from: datePickerlecEnd.date)
        
        
        self.view.endEditing(true)
    }
    
    
    func labEndDatePicker()
    {
        datePickerlabEnd.datePickerMode = .time
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedlabEnd))
        toolbar.setItems([doneButton], animated: false)
        
        
        labEnd.inputAccessoryView=toolbar
        labEnd.inputView=datePickerlecEnd
        
        
        
    }
    
    func donePressedlabEnd()
    {
        let dateFormatter=DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        labEnd.text = dateFormatter.string(from: datePickerlecEnd.date)
        self.view.endEditing(true)
    }
    

// Mark:- Day Button Actions
//Lecture Days Buttons
    @IBAction func LecMonPressed(_ sender: Any)
    {
        if lecMonButton==0
        {
            (sender as! UIButton).backgroundColor = UIColor.red
            lecDays[0]=1
            lecMonButton=1
            
        }
        else
        {
            (sender as! UIButton).backgroundColor = UIColor.white
            lecDays[0]=0
            lecMonButton=0
        }
        
    }
    
    
    
    @IBAction func LecTuePressed(_ sender: Any) {
        if lecTueButton==0
        {
            (sender as! UIButton).backgroundColor = UIColor.red
            lecDays[1]=1
            lecTueButton=1
            
        }
        else
        {
            (sender as! UIButton).backgroundColor = UIColor.white
            lecDays[1]=0
            lecTueButton=0
        }

    }
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func LecWedPressed(_ sender: Any) {
        if lecWedButton==0
        {
            (sender as! UIButton).backgroundColor = UIColor.red
            lecDays[2]=1
            lecWedButton=1
            
        }
        else
        {
            (sender as! UIButton).backgroundColor = UIColor.white
            lecDays[2]=0
            lecWedButton=0
        }

    }
    
    @IBAction func LecThursPressed(_ sender: Any) {
        if lecThurButton==0
        {
            (sender as! UIButton).backgroundColor = UIColor.red
            lecDays[3]=1
            lecThurButton=1
            
        }
        else
        {
            (sender as! UIButton).backgroundColor = UIColor.white
            lecDays[3]=0
            lecThurButton=0
        }

    }

    @IBAction func LecFriPressed(_ sender: Any) {
        if lecFriButton==0
        {
            (sender as! UIButton).backgroundColor = UIColor.red
            lecDays[4]=1
            lecFriButton=1
            
        }
        else
        {
            (sender as! UIButton).backgroundColor = UIColor.white
            lecDays[4]=0
            lecFriButton=0
        }

    }
    
    //Office Days Buttons
    

    @IBAction func OffMonPressed(_ sender: Any) {
        if offMonButton==0
        {
            (sender as! UIButton).backgroundColor = UIColor.red
            offDays[0]=1
            offMonButton=1
            
        }
        else
        {
            (sender as! UIButton).backgroundColor = UIColor.white
            offDays[0]=0
            offMonButton=0
        }

    }
  
    
    @IBAction func OffTuePressed(_ sender: Any) {
        if offTueButton==0
        {
            (sender as! UIButton).backgroundColor = UIColor.red
            offDays[1]=1
            offTueButton=1
            
        }
        else
        {
            (sender as! UIButton).backgroundColor = UIColor.white
            offDays[1]=0
            offTueButton=0
        }

    }
    
    
    
    @IBAction func OffWedPressed(_ sender: Any) {
        if offWedButton==0
        {
            (sender as! UIButton).backgroundColor = UIColor.red
            offDays[2]=1
            offWedButton=1
            
        }
        else
        {
            (sender as! UIButton).backgroundColor = UIColor.white
            offDays[2]=0
            offWedButton=0
        }

    }
    
    
    @IBAction func OffThurPressed(_ sender: Any) {
        if offThurButton==0
        {
            (sender as! UIButton).backgroundColor = UIColor.red
            offDays[3]=1
            offThurButton=1
            
        }
        else
        {
            (sender as! UIButton).backgroundColor = UIColor.white
            offDays[3]=0
            offThurButton=0
        }

    }
    
    
    @IBAction func OffFriPressed(_ sender: Any) {
        if offFriButton==0
        {
            (sender as! UIButton).backgroundColor = UIColor.red
            offDays[4]=1
            offFriButton=1
            
        }
        else
        {
            (sender as! UIButton).backgroundColor = UIColor.white
            offDays[4]=0
            offFriButton=0
        }

    }
    
    //Lab Days Buttons
    
    @IBAction func LabMonPressed(_ sender: Any) {
        if labMonButton==0
        {
            (sender as! UIButton).backgroundColor = UIColor.red
            labDays[0]=1
            labMonButton=1
            
        }
        else
        {
            (sender as! UIButton).backgroundColor = UIColor.white
            labDays[0]=0
            labMonButton=0
        }

        
    }
    
    
    
    @IBAction func LabTuePressed(_ sender: Any) {
        
        if labTueButton==0
        {
            (sender as! UIButton).backgroundColor = UIColor.red
            labDays[1]=1
            labTueButton=1
            
        }
        else
        {
            (sender as! UIButton).backgroundColor = UIColor.white
            labDays[1]=0
            labTueButton=0
        }

        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func LabWedPressed(_ sender: Any) {
        if labWedButton==0
        {
            (sender as! UIButton).backgroundColor = UIColor.red
            labDays[2]=1
            labWedButton=1
            
        }
        else
        {
            (sender as! UIButton).backgroundColor = UIColor.white
            labDays[2]=0
            labWedButton=0
        }

    }
    
    @IBAction func LabThurPressed(_ sender: Any) {
        if labThurButton==0
        {
            (sender as! UIButton).backgroundColor = UIColor.red
            labDays[3]=1
            labThurButton=1
            
        }
        else
        {
            (sender as! UIButton).backgroundColor = UIColor.white
            labDays[3]=0
            labThurButton=0
        }

    }
    
    
    @IBAction func LabFriPressed(_ sender: Any) {
        if labFriButton==0
        {
            (sender as! UIButton).backgroundColor = UIColor.red
            labDays[4]=1
            labFriButton=1
            
        }
        else
        {
            (sender as! UIButton).backgroundColor = UIColor.white
            labDays[4]=0
            labFriButton=0
        }
        

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
