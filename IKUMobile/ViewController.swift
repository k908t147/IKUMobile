//
//  ViewController.swift
//  IKUMobile
//
//  Created by Keshawn Triplett on 3/15/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
// Written By: Keshawn Triplett
// Tested By: Keshawn Triplett

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var courseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
     override func viewDidAppear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

