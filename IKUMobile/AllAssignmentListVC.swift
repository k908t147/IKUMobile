//
//  AllAssignmentListVC.swift
//  IKUMobile
//
//  Created by Keshawn Triplett on 4/20/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
//

import UIKit
import CoreData

class AllAssignmnetListVC: UITableViewController {
    
    var assignment=[Assignment]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        // deleteRecords()
        let request:NSFetchRequest<Assignment>=Assignment.fetchRequest()
        do
        {
            assignment=try DatabaseController.persistentContainer.viewContext.fetch(request)
            
        }
        catch
        {
            print("There are errors")
        }
        self.tableView.reloadData()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let request:NSFetchRequest<Assignment>=Assignment.fetchRequest()
        do
        {
            assignment=try DatabaseController.persistentContainer.viewContext.fetch(request)
            
        }
        catch
        {
            print("There are errors")
        }
        self.tableView.reloadData()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return assignment.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        
        let assignments=assignment[indexPath.row]
        cell.textLabel?.text=assignments.title
        cell.detailTextLabel?.text=assignments.dueDate
        return cell
    }
    
    
    
    //Deleting Items from tableView and Core Data
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle==UITableViewCellEditingStyle.delete
        {
            
            let assignment1 = assignment[indexPath.row] as NSManagedObject
            DatabaseController.persistentContainer.viewContext.delete(assignment1)
            DatabaseController.saveContext()
            assignment.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "toNewAssignment")
            
        {
            if let destination=segue.destination as? AddAssignmentVC {
                
                destination.notCourseSpecific=1
            
            }
            
        }
        if (segue.identifier == "toSelectedAssignment")
            
        {
            if let destination=segue.destination as? SelectedAssignmentVC {
                
                
                destination.name = assignment[tableView.indexPathForSelectedRow!.row].title
                destination.dueDate=assignment[tableView.indexPathForSelectedRow!.row].dueDate
                destination.dueTime=assignment[tableView.indexPathForSelectedRow!.row].dueTime
                destination.assignmentLocation=tableView.indexPathForSelectedRow!.row
                destination.assignments=assignment
                
                
                
            }
            
        }

    }
    
    
    func deleteRecords()
    {
        
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Assignment")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try DatabaseController.persistentContainer.viewContext.execute(deleteRequest)
            DatabaseController.saveContext()
        } catch {
            print ("There was an error")
        }
        
        
        
        
        
        
}
}
