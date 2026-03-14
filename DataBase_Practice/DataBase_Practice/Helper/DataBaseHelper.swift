//
//  DataBaseHelper.swift
//  DataBase_Practice
//
//  Created by OBMac-13 on 13/03/26.
//

import Foundation
import CoreData
import UIKit

class DataBaseHelper{
    static var shareInstance : DataBaseHelper = DataBaseHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func saveData(object:[String:String]){
        let users = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context!) as! Users
        
        users.username = object["username"]
        users.password = object["password"]
        users.age = object["age"]

        do{
            try context?.save()
        }catch{
            print("daata not save")
        }
    }
    
    func saveCollegeData(object:[String:String]){
        let clg = NSEntityDescription.insertNewObject(forEntityName: "College", into: context!) as! College
        
        clg.name = object["collagename"]
        clg.university = object["collegeuniversity"]
        clg.city = object["collegecity"]
        clg.address = object["collegeaddress"]

        do{
            try context?.save()
        }catch{
            print("college not save")
        }
    }
    
    
    func getAllCollegeData() -> [College]{
        var arrCollege = [College]()
        let fetchrequest = NSFetchRequest<NSManagedObject>(entityName: "College")
        do{
            arrCollege = try context?.fetch(fetchrequest) as! [College]
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        return arrCollege
     
    }
}
