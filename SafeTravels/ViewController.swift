//
//  ViewController.swift
//  SafeTravels
//
//  Created by Max Dignan on 11/14/15.
//  Copyright © 2015 Dignan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var startTimer: UIImageView!
    @IBOutlet weak var clickSettings: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("hello")
        // Do any additional setup after loading the view, typically from a nib.
        
        let greenTap = UITapGestureRecognizer(target: self, action: Selector("startTimerFunc"))
        
        greenTap.numberOfTapsRequired = 1
        
        startTimer.userInteractionEnabled = true
        startTimer.addGestureRecognizer(greenTap)
        
        let gearTap = UITapGestureRecognizer(target: self, action: Selector("openSettings"))
        gearTap.numberOfTapsRequired = 1
        
        clickSettings.userInteractionEnabled = true
        clickSettings.addGestureRecognizer(gearTap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startTimerFunc(){
        print("start timer")
        
    }
    
    func openSettings() {
        print("open settings")
        
        let view = self.storyboard?.instantiateViewControllerWithIdentifier("settings") as! SettingsViewController
        
        self.presentViewController(view, animated: true, completion: nil)
    }


}

