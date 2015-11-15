//
//  ModelHandler.swift
//  SafeTravels
//
//  Created by Max Dignan on 11/14/15.
//  Copyright © 2015 Dignan. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ModelHandler{
    
    static var lMan: LocMan!
    static var managedContext: NSManagedObjectContext!
    static var timer: TimerHelper!
    
    static func setUp() {
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        managedContext = appDelegate.managedObjectContext
        
        timer = TimerHelper()
    }
    
    static func addNumber(number: String){
        let entity =  NSEntityDescription.entityForName("Numbers",
            inManagedObjectContext:managedContext)
        
        let person = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        person.setValue(number, forKey: "number")
        
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    static func getNumbers() -> [String]{
        let fetchRequest = NSFetchRequest(entityName: "Numbers")
        
        //3
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest) as! [Numbers]
            
            return results.map({return $0.number!})
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            return []
        }
    }
    
    static func setMessage(message: String){
        let entity =  NSEntityDescription.entityForName("Messages",
            inManagedObjectContext:managedContext)
        
        let person = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        person.setValue(message, forKey: "message")
        
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    static func getMessage() -> String{
        let fetchRequest = NSFetchRequest(entityName: "Messages")
        
        //3
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest) as! [Messages]
            if results.count < 1 {throw NSError(coder: NSCoder())!}
            return (results.last?.message!)!
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            return ""
        }
    }
    
    static func setId(id: String){
        let entity =  NSEntityDescription.entityForName("Ids",
            inManagedObjectContext:managedContext)
        
        let timer = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        timer.setValue(id, forKey: "id")
        
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    static func getId() -> String{
        let fetchRequest = NSFetchRequest(entityName: "Ids")
        
        //3
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest) as! [Ids]
            if results.count < 1 {throw NSError(coder: NSCoder())!}
            return (results.last?.id!)!
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            return ""
        }
    }
}