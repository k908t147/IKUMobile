//
//  SelectedAssignmentVC.swift
//  IKUMobile
//
//  Created by Keshawn Triplett on 4/19/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
//

import UIKit

class SelectedAssignmentVC: UIViewController {

    var name: String!
    var dueDate: String?
    var dueTime: String?
    
    
    
    @IBOutlet weak var assignmentName: UILabel!
    
    @IBOutlet weak var assignmentDueDate: UILabel!
    
    @IBOutlet weak var assignmentDueTime: UILabel!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignmentName.text=name
        assignmentDueDate.text=dueDate
        assignmentDueTime.text=dueTime
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
