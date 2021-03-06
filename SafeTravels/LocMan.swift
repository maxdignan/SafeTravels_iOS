//
//  LocMan.swift
//  SafeTravels
//
//  Created by Max Dignan on 11/14/15.
//  Copyright © 2015 Dignan. All rights reserved.
//

import Foundation
import CoreLocation

class LocMan: NSObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!
    
    var myLocation: CLLocation!
    
    init (loc: CLLocationManager) {
        super.init()
        
        locationManager = loc
        
    }
    
    func getGPS() -> String {
        if ((myLocation) != nil){
        return String(myLocation.coordinate.latitude) + "+" + String(myLocation.coordinate.longitude)
        } else {
            return "GPS lcoation not available currently"
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocale = locations.last
        myLocation = newLocale
    }
}