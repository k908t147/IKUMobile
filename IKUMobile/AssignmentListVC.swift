//
//  AssignmentListVC.swift
//  IKUMobile
//
//  Created by Keshawn Triplett on 4/17/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
//

import UIKit
import CoreData

class AssignmentListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var assignments=[Assignment]()
    var courses=[Courses]()
    var objectLocation: Int!

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        print(courses[objectLocation].courseName!)

        tableview.delegate=self
        tableview.dataSource=self
    }
    
    override func viewDidAppear(_ animated: Bool) {
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


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        cell.detailTextLabel?.text=assignment.dueDate
        return cell

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
