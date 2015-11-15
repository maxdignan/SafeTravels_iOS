//
//  TimerHelper.swift
//  SafeTravels
//
//  Created by Max Dignan on 11/15/15.
//  Copyright © 2015 Dignan. All rights reserved.
//

import Foundation

class TimerHelper{
    var timeLeft: Int!
    var id: String!
    
    init(){
        timeLeft = 0
        id = ""
    }
    
    func startCountdown(id: String){
        self.id = id
        self.timeLeft = 7 * 60
    }
}