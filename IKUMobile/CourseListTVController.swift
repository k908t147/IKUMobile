//
//  CourseListTVController.swift
//  IKUMobile
//
//  Created by Keshawn Triplett on 3/30/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
// Written By: Keshawn Triplett
// Tested By: Keshawn Triplett

import UIKit
import CoreData

class CourseListTVController: UITableViewController {
   
    var courses=[Courses]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

   
       // deleteRecords()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        let request:NSFetchRequest<Courses>=Courses.fetchRequest()
        do
        {
            courses=try DatabaseController.persistentContainer.viewContext.fetch(request)
            
        }
        catch
        {
            print("There are errors")
        }
        self.tableView.reloadData()

       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        let request:NSFetchRequest<Courses>=Courses.fetchRequest()
        do
        {
            courses=try DatabaseController.persistentContainer.viewContext.fetch(request)
            
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
       
        return courses.count
        
    }
  

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        
        let course=courses[indexPath.row]
        cell.textLabel?.text=course.courseName
        return cell
    }
    
    
    
    //Deleting Items from tableView and Core Data
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle==UITableViewCellEditingStyle.delete
        {
     
        let course = courses[indexPath.row] as NSManagedObject
        DatabaseController.persistentContainer.viewContext.delete(course)
        DatabaseController.saveContext()
            courses.remove(at: indexPath.row)
        tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if (segue.identifier == "courseinfo")
        
        {
            if let destination=segue.destination as? SelectedCourseVC {
                
            destination.courseTitle = courses[tableView.indexPathForSelectedRow!.row].courseName
            destination.objectLocation=tableView.indexPathForSelectedRow!.row
            destination.courses=courses
          
            
        }
    }
    }
    
    
    func deleteRecords()
    {
        
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Courses")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            
            do {
                try DatabaseController.persistentContainer.viewContext.execute(deleteRequest)
                 DatabaseController.saveContext()
            } catch {
                print ("There was an error")
            }
        

    



    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
