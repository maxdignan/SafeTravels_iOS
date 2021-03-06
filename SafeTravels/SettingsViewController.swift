//
//  SettingsViewController.swift
//  SafeTravels
//
//  Created by Max Dignan on 11/14/15.
//  Copyright © 2015 Dignan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    var timerHolder: Timer!
        @IBOutlet weak var updateMessage: UIButton!
    @IBOutlet weak var numberField: UITextField!
    
    @IBOutlet weak var messageField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addFriend(sender: AnyObject) {
        
        print(numberField.text)
        
        ModelHandler.addNumber(numberField.text!)
        
        numberField.text = ""
        
    }

    @IBAction func backToMenu(sender: AnyObject) {
        let view = self.storyboard?.instantiateViewControllerWithIdentifier("main") as! ViewController
        
        view.timer = timerHolder
        
        self.presentViewController(view, animated: true, completion: nil)

    }
    @IBAction func updateMessageFunc(sender: AnyObject) {
        print(messageField.text)
        
        ModelHandler.setMessage(messageField.text!)
    }

}
