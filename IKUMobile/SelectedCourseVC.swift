//
//  SelectedCourseVC.swift
//  IKUMobile
//
//  Created by Keshawn Triplett on 4/1/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
//

import UIKit

class SelectedCourseVC: UIViewController {

    @IBOutlet weak var courseName: UILabel!
    var courses=[Courses]()
    var courseTitle: String!
    var objectLocation: Int!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.courseName.text=courses[objectLocation].courseName
    }
   override func viewDidAppear(_ animated: Bool) {
        self.courseName.text=courses[objectLocation].courseName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "toAssignments")
            
        {
            if let destination=segue.destination as? AssignmentListVC {
                
                destination.courses = courses
                destination.objectLocation=objectLocation
                
            }
        }
        if (segue.identifier == "Update")
            
        {
            if let destination=segue.destination as? UpdateCourse {
                
                destination.courses = courses
                destination.objectLocation=objectLocation
                
            }
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
