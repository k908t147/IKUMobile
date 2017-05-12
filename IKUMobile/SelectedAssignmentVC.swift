//
//  SelectedAssignmentVC.swift
//  IKUMobile
//
//  Created by Keshawn Triplett on 4/19/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
//  Written By: Keshawn Triplett
// Tested By: Keshawn Triplett

import UIKit

class SelectedAssignmentVC: UIViewController {

    var name: String!
    var dueDate: String?
    var dueTime: String?
    var assignmentLocation: Int!
    var assignments=[Assignment]()

    
    
    
    @IBOutlet weak var assignmentName: UILabel!
    
    @IBOutlet weak var assignmentDueDate: UILabel!
    
    @IBOutlet weak var assignmentDueTime: UILabel!
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        assignmentName.text=assignments[assignmentLocation].title
        assignmentDueDate.text=assignments[assignmentLocation].dueDate
        assignmentDueTime.text=assignments[assignmentLocation].dueTime
        

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        assignmentName.text=name
        assignmentDueDate.text=dueDate
        assignmentDueTime.text=dueTime
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "toEditAssignment")
            
        {
            if let destination=segue.destination as? EditAssignmentVC {
                
                destination.assignments = assignments
                destination.assignmentLocation=assignmentLocation
                
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
