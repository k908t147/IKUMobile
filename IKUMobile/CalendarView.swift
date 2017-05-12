//
//
//  IKUMobile
//
//  Created by Keshawn Triplett on 4/30/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
// Written By: Luis Chachayma
// Tested By: Luis Chachayma

import UIKit

class CalendarView: UIViewController {
    
    @IBOutlet weak var myWeb: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
       EventHelper().requestAccessToCalendar()//requests access to calendar
       //EventHelper().addAppleEvents()
        
        UIApplication.shared.openURL(NSURL(string: "calshow://")! as URL)
        
        
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
