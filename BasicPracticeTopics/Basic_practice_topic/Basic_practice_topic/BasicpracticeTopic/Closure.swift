//
//  Closure.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 08/01/26.
//

import Foundation

class Closure {
    
    struct Company {
        let name : String
        let isPublic : Bool
        let stockPrice : Double
    }
    
    var companies : [Company] = [
        Company(name: "Google", isPublic: true, stockPrice: 15.9)
        ,Company(name: "Apple", isPublic: true, stockPrice: 120.9)
        ,Company(name: "Microsoft", isPublic: true, stockPrice: 25.9)
    ]
    
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    
//    func backwards(_ s1 : String, _ s2 :String) -> Bool{
//        return s1 < s2
//    }
//    
    
    
    func demo(){
        let publicCompany = companies.filter(\.isPublic).map(\.name)
        
        print(publicCompany)
    }
    
    
    
    
    //simple without parameter
    var callmethod = {
        print("hello")
    }

    let sayHello = { (name:String) in
        print("Hello \(name)")
    }
    
    
    //with return types
    let add = { (a:Int, b:Int) -> String in
        return " answer : \(a+b)"
    }
    
    func DounloadData(completion : () -> Void){
        print("Download Started")
        completion()
    }
    
    func checknum(num : Int, action: (Int)->Void ){
        if num<=0{
            action(num)
        }else{
            print("value is greater")
        }
    }
    
    func ValidateUser(name:String, validate:()->Void, invalid : (String)->Void){
        if name.count>=3{
            validate()
        }else{
            invalid("username must be greater then 3 characters")
        }
    }
    
    
//    Auto closure÷
    func goodmorningMsg(ismorning:Bool , name: @autoclosure ()->String){
        if(ismorning){
            print("Good morning \(name())")
        }
    }
    
    func assignname(name:String)->String{
        return name
    }
   
    
}



