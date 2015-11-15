//
//  BlockedViewController.swift
//  SafeTravels
//
//  Created by Max Dignan on 11/15/15.
//  Copyright © 2015 Dignan. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication

class BlockedViewController: UIViewController {
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func tryAgain(sender: AnyObject) {
        var laContext = LAContext()
        
        var err = NSErrorPointer()
        
        if laContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: err) {
            laContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Are you the device owner?", reply: { (boo, err) in
                if (boo){
                    let view = self.storyboard?.instantiateViewControllerWithIdentifier("main") as! ViewController
                    
                    view.timer = self.timer
                    
                    self.presentViewController(view, animated: true, completion: nil)
                }
                
                if ((err) != nil){
                    
                }
            })
        } else {
            print("no touch id available")
        }

        
    }
}