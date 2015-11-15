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
    
    
    static var managedContext: NSManagedObjectContext!
    
    static func setUp() {
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        managedContext = appDelegate.managedObjectContext
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
            
            return (results.last?.message!)!
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            return ""
        }
    }
}