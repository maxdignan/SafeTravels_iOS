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
    
    @IBOutlet weak var secondsLeft: UILabel!
    var timer: Timer!

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
        
        home.hidden = true
        emergencyButton.hidden = true
        secondsLeft.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startTimerFunc(){
        print("start timer")
        
        if (timer != nil){
            timer.stop()
            timer = nil
        }
        
        home.hidden = false
        emergencyButton.hidden = false
        secondsLeft.hidden = false
        
        timer = Timer(duration: 1 * 60, view: self)
        timer.start()
    }
    
    func openSettings() {
        print("open settings")
        
        let view = self.storyboard?.instantiateViewControllerWithIdentifier("settings") as! SettingsViewController
        
        self.presentViewController(view, animated: true, completion: nil)
    }

    @IBOutlet weak var home: UIButton!

    @IBAction func imHome(sender: AnyObject) {
        timer = nil;
        HandleConnection.cancelMessage()
        startTimer.hidden = true
    }
    
    @IBOutlet weak var emergencyButton: UIButton!
    @IBAction func emergencyCallNow(sender: AnyObject) {
        HandleConnection.scheduleMessage(0)
    }
    
    
    class Timer{
        var timer = NSTimer();
        // the callback to be invoked everytime the timer 'ticks'
        //the total duration in seconds for which the timer should run to be set by the caller
        let duration: Int;
        //the amount of time in seconds elapsed so far
        var elapsedTime: Int = 0;
        
        var view: ViewController!
        
        
        /**
         :param: an integer duration specifying the total time in seconds for which the timer should run repeatedly
         :param: handler is reference to a function that takes an Integer argument representing the elapsed time allowing the implementor to process elapsed time and returns void
         */
        init(duration: Int , view: ViewController){
            self.duration = duration;
            self.view = view
        }
        
        /**
         Schedule the Timer to run every 1 second and invoke a callback method specified by 'selector' in repeating mode
         */
        func start(){
            self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "onTick", userInfo: nil, repeats: true);
            
            HandleConnection.scheduleMessage(self.duration + 5 / 60)
        }
        
        /**
         invalidate the timer
         */
        func stop(){
            print("timer was invaidated from stop()")
            timer.invalidate();
            HandleConnection.cancelMessage()
        }
        
        /**
         Called everytime the timer 'ticks'. Keep track of the total time elapsed and trigger the handler to notify the implementors of the current 'tick'. If the amount of time elapsed is the same as the total duration for the timer was intended to run, stop the timer.
         */
        @objc func onTick() {
            print("onTick")
            //increment the elapsed time by 1 second
            self.elapsedTime++;

            //If the amount of elapsed time in seconds is same as the total time in seconds for which this timer was intended to run, stop the timer
            view.secondsLeft.text = String(self.duration - self.elapsedTime) + " seconds left"
            if self.elapsedTime - 1 == self.duration {
                HandleConnection.scheduleMessage(0)
                self.stop()
            }
        }
        deinit{
            print("timer was invalidated from deinit()")
            self.timer.invalidate();
            self.stop()
        }
    }
    
}

