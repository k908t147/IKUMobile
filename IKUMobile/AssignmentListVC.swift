//
//  AssignmentListVC.swift
//  IKUMobile
//
//  Created by Keshawn Triplett on 4/17/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
// Written By: Keshawn Triplett
// Tested By: Keshawn Triplett

import UIKit
import CoreData

class AssignmentListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var assignments=[Assignment]()
    var courses=[Courses]()
    var objectLocation: Int!
    var menuOpen=0
    
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!

    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var menuView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        navBar.title=courses[objectLocation].courseName!+" Assignments"
        leadingConstraint.constant = -160
    
        tableview.delegate=self
        tableview.dataSource=self
        
        menuView.layer.shadowOpacity=1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        navBar.title=courses[objectLocation].courseName!+" Assignments"
        leadingConstraint.constant = -160
        let request:NSFetchRequest<Assignment>=Assignment.fetchRequest()
        let coursename=courses[objectLocation].courseName
        request.predicate = NSPredicate(format: "courseName == %@", coursename!)
        do
        {
            assignments=try DatabaseController.persistentContainer.viewContext.fetch(request)
            
        }
        catch
        {
            print("There are errors")
        }
        tableview.reloadData()
        
        
    }



    @IBAction func openMenu(_ sender: Any) {
        
        if(menuOpen==0)
        {
            leadingConstraint.constant=0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            menuOpen=1

        }
       else
        {
            leadingConstraint.constant = -160
            menuOpen=0
        }
        
    }
    
    

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        self.performSegue(withIdentifier: "toSelectedAssignment", sender: self)
        
        
    }
   
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "cell")
        let assignment=assignments[indexPath.row]
    
        cell.textLabel?.text=assignment.title
        cell.detailTextLabel?.textColor=UIColor.red
        cell.detailTextLabel?.text=assignment.dueDate
        return cell

    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle==UITableViewCellEditingStyle.delete
        {
            
            let assignment = assignments[indexPath.row] as NSManagedObject
            DatabaseController.persistentContainer.viewContext.delete(assignment)
            DatabaseController.saveContext()
            assignments.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "toAddAssignment")
            
        {
            if let destination=segue.destination as? AddAssignmentVC {
                
                destination.courses = courses
                destination.objectLocation=objectLocation
                
            }
        }
        if (segue.identifier == "toSelectedAssignment")
            
        {
            if let destination=segue.destination as? SelectedAssignmentVC {
                
                destination.name = assignments[tableview.indexPathForSelectedRow!.row].title
                destination.dueDate=assignments[tableview.indexPathForSelectedRow!.row].dueDate
                destination.dueTime=assignments[tableview.indexPathForSelectedRow!.row].dueTime
                destination.assignmentLocation=tableview.indexPathForSelectedRow!.row
                destination.assignments=assignments
                
            }
        }
        
        
    }


}
