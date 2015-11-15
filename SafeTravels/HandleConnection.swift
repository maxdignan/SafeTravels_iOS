//
//  HandleConnection.swift
//  SafeTravels
//
//  Created by Max Dignan on 11/14/15.
//  Copyright © 2015 Dignan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HandleConnection{
    
    static func sendMessageNow(){
        let gps: String = ModelHandler.lMan.getGPS()
        
        //let message = ModelHandler.getMessage()
        //let totalMessage = message + " " + gps
        
        //let numbers = ModelHandler.getNumbers()
        
        
        Alamofire.request(.GET, "https://konnect-ohio.herokuapp.com/setUpText?numbers=6149403632&message=this_is_a_test")
            .response { (request, response, data, error) in
                print(response)
//                print(data)
//                
//                let json: JSON! = JSON((data?.description)!)
//                print(json)
                
                
        }
    }
    
    static func scheduleMessage(mins: Int) {
        var gps: String = ModelHandler.lMan.getGPS()
        
        
        let message = ModelHandler.getMessage()
        let totalMessage = message + " " + gps
        
        var prepend = ""
        if mins > 0{
            prepend = "Hey, something seems to be wrong. I haven't checked in in a while. "
        }
        
        let propMessage = prepend + totalMessage.stringByReplacingOccurrencesOfString(" ", withString: "_")
        
        let numbers = ModelHandler.getNumbers()
        
        var num = ""
        numbers.forEach({num += $0 + ","})
        
        num = num.substringToIndex(num.endIndex.predecessor())
        
        let str = "https://konnect-ohio.herokuapp.com/futureText?numbers=" + num + "&message=" + propMessage + "&minutes=" + String(mins)
        
        let urlString = str.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        
        Alamofire.request(.GET, urlString).response { (request, response, data, error) in
            print(response)
            if let id = response?.allHeaderFields["X-Data-Id"] as? String {
                ModelHandler.setId(id);
            }
                
        }

    }
    
    static func cancelMessage(){
        let id = ModelHandler.getId()
        Alamofire.request(.GET, "https://konnect-ohio.herokuapp.com/cancelText?id=" + id).response { (request, response, data, error) in

            
        }
    }
}