//
//  SelectedCourseVC.swift
//  IKUMobile
//
//  Created by Keshawn Triplett on 4/1/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
// Written By: Keshawn Triplett
// Tested By: Keshawn Triplett

import UIKit

class SelectedCourseVC: UIViewController {

    
    var courses=[Courses]()
    var courseTitle: String!
    var objectLocation: Int!
    
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    
    @IBOutlet weak var lecInstructor: UILabel!
    
    @IBOutlet weak var lecLocation: UILabel!
    
    @IBOutlet weak var lecStart: UILabel!
    
    @IBOutlet weak var lecEnd: UILabel!
    
    @IBOutlet weak var offLocation: UILabel!
    
    @IBOutlet weak var offStart: UILabel!

    @IBOutlet weak var offEnd: UILabel!
    
    @IBOutlet weak var labInstructor: UILabel!
    
    @IBOutlet weak var labLocation: UILabel!
    
    @IBOutlet weak var labStart: UILabel!
    
    @IBOutlet weak var labEnd: UILabel!
    
    
    //Days outlets
    
    @IBOutlet weak var lecMon: UIButton!
    
    @IBOutlet weak var lecTue: UIButton!
    
    @IBOutlet weak var lecWed: UIButton!
    
    @IBOutlet weak var lecThur: UIButton!
    
    @IBOutlet weak var lecFri: UIButton!
    
    
    @IBOutlet weak var offMon: UIButton!
    
    @IBOutlet weak var offTue: UIButton!
    
    @IBOutlet weak var offWed: UIButton!
    
    @IBOutlet weak var offThur: UIButton!
    
    @IBOutlet weak var offFri: UIButton!
    
    @IBOutlet var scrollView: UIView!
    
    @IBOutlet weak var labMon: UIButton!
    
    @IBOutlet weak var labTue: UIButton!
    @IBOutlet weak var labWed: UIButton!
    
    @IBOutlet weak var labThur: UIButton!
    
    @IBOutlet weak var labFri: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
       
        //Populate feilds with course information
        self.lecInstructor.text=courses[objectLocation].lecInstructor
        self.lecLocation.text=courses[objectLocation].lecLocation
        self.lecStart.text=courses[objectLocation].lecStart
         self.lecEnd.text=courses[objectLocation].lecEnd
        self.offLocation.text=courses[objectLocation].offLocation
        self.offStart.text=courses[objectLocation].offStart
        self.offEnd.text=courses[objectLocation].offEnd
        self.labInstructor.text=courses[objectLocation].labInstructor
        self.labStart.text=courses[objectLocation].labStart
        self.labEnd.text=courses[objectLocation].labEnd
        self.labLocation.text=courses[objectLocation].labLocation
    
        self.navBar.title=courses[objectLocation].courseName
        
        //Convert Day array from core Data
        let unarchiveObject = NSKeyedUnarchiver.unarchiveObject(with: courses[objectLocation].lecDays! as Data)
        let lecDays = unarchiveObject as AnyObject! as! Array<Int>
        
        let unarchiveObject1 = NSKeyedUnarchiver.unarchiveObject(with: courses[objectLocation].labDays! as Data)
        let labDays = unarchiveObject1 as AnyObject! as! Array<Int>
        
        let unarchiveObject2 = NSKeyedUnarchiver.unarchiveObject(with: courses[objectLocation].offDays! as Data)
        let offDays = unarchiveObject2 as AnyObject! as! Array<Int>

        //Set Days
        if(lecDays[0]==1)
        {
            lecMon.backgroundColor=UIColor.red
    
        }
        if(lecDays[1]==1)
        {
            lecTue.backgroundColor=UIColor.red
        }
        if(lecDays[2]==1)
        {
            lecWed.backgroundColor=UIColor.red
        }
        if(lecDays[3]==1)
        {
            lecThur.backgroundColor=UIColor.red
        }
        if(lecDays[4]==1)
        {
            lecFri.backgroundColor=UIColor.red
        }
        
        
        
        
        if(labDays[0]==1)
        {
            labMon.backgroundColor=UIColor.red
        }
        if(labDays[1]==1)
        {
            labTue.backgroundColor=UIColor.red
        }
        if(labDays[2]==1)
        {
            labWed.backgroundColor=UIColor.red
        }
        if(labDays[3]==1)
        {
            labThur.backgroundColor=UIColor.red
        }
        if(labDays[4]==1)
        {
            labFri.backgroundColor=UIColor.red
        }

        

        
        if(offDays[0]==1)
        {
            offMon.backgroundColor=UIColor.red
        }
        if(offDays[1]==1)
        {
            offTue.backgroundColor=UIColor.red
        }
        if(offDays[2]==1)
        {
            offWed.backgroundColor=UIColor.red
        }
        if(offDays[3]==1)
        {
            offThur.backgroundColor=UIColor.red
        }
        if(offDays[4]==1)
        {
            offFri.backgroundColor=UIColor.red
        }

        
        
 
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
   override func viewDidAppear(_ animated: Bool) {
    self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    
    self.lecInstructor.text=courses[objectLocation].lecInstructor
    self.lecLocation.text=courses[objectLocation].lecLocation
    self.lecStart.text=courses[objectLocation].lecStart
    self.lecEnd.text=courses[objectLocation].lecEnd
    self.offLocation.text=courses[objectLocation].offLocation
    self.offStart.text=courses[objectLocation].offStart
    self.offEnd.text=courses[objectLocation].offEnd
    self.labInstructor.text=courses[objectLocation].labInstructor
    self.labStart.text=courses[objectLocation].labStart
    self.labEnd.text=courses[objectLocation].labEnd
    
    let unarchiveObject = NSKeyedUnarchiver.unarchiveObject(with: courses[objectLocation].lecDays! as Data)
    let lecDays = unarchiveObject as AnyObject! as! Array<Int>
    
    let unarchiveObject1 = NSKeyedUnarchiver.unarchiveObject(with: courses[objectLocation].labDays! as Data)
    let labDays = unarchiveObject1 as AnyObject! as! Array<Int>
    
    let unarchiveObject2 = NSKeyedUnarchiver.unarchiveObject(with: courses[objectLocation].offDays! as Data)
    let offDays = unarchiveObject2 as AnyObject! as! Array<Int>
    
    //Set Days
    if(lecDays[0]==1)
    {
        lecMon.backgroundColor=UIColor.red
    }
    if(lecDays[1]==1)
    {
        lecTue.backgroundColor=UIColor.red
    }
    if(lecDays[2]==1)
    {
        lecWed.backgroundColor=UIColor.red
    }
    if(lecDays[3]==1)
    {
        lecThur.backgroundColor=UIColor.red
    }
    if(lecDays[4]==1)
    {
        lecFri.backgroundColor=UIColor.red
    }
    
    
    
    
    if(labDays[0]==1)
    {
        labMon.backgroundColor=UIColor.red
    }
    if(labDays[1]==1)
    {
        labTue.backgroundColor=UIColor.red
    }
    if(labDays[2]==1)
    {
        labWed.backgroundColor=UIColor.red
    }
    if(labDays[3]==1)
    {
        labThur.backgroundColor=UIColor.red
    }
    if(labDays[4]==1)
    {
        labFri.backgroundColor=UIColor.red
    }
    
    
    
    
    if(offDays[0]==1)
    {
        offMon.backgroundColor=UIColor.red
    }
    if(offDays[1]==1)
    {
        offTue.backgroundColor=UIColor.red
    }
    if(offDays[2]==1)
    {
        offWed.backgroundColor=UIColor.red
    }
    if(offDays[3]==1)
    {
        offThur.backgroundColor=UIColor.red
    }
    if(offDays[4]==1)
    {
        offFri.backgroundColor=UIColor.red
    }


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
