//
//  BlackboardVC.swift
//  IKUMobile
//
//  Created by Keshawn Triplett on 4/30/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
// Written by: Arash Kamwand

import UIKit

class BlackboardVC: UIViewController {
    
    @IBOutlet weak var myWeb: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        
        let url = URL(string: "https://login.ku.edu/cas/login?service=https%3A%2F%2Fcourseware.ku.edu%2Fwebapps%2Fbb-auth-provider-cas-bb_bb60%2Fexecute%2FcasLogin%3Fcmd%3Dlogin%26authProviderId%3D_124_1%26redirectUrl%3Dhttps%253A%252F%252Fcourseware.ku.edu%252Fwebapps%252Fportal%252Fexecute%252FdefaultTab%26globalLogoutEnabled%3Dtrue")
        myWeb.loadRequest(URLRequest(url: url!))
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

