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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.courseName.delegate=self
        self.lecInstructor.delegate=self
        self.lecLocation.delegate=self
        self.lecDays.delegate=self
        self.lecEnd.delegate=self
        self.offLocation.delegate=self
        self.offDays.delegate=self
        self.offStart.delegate=self
        self.offEnd.delegate=self
        
        

        // Do any additional setup after loading the view.
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
