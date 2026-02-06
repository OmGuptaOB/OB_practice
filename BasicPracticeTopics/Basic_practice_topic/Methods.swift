//
//  Methods.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 08/01/26.
//

import Foundation

class Methods{
    
    

        var car = "Toyota"
        
        func useCompanyCar(car:String){
            self.car = car
            print("using company car which is \(car)")
        }
        
        static func companyCar(car:String, color:String){
        
            print("using company car which is new \(car) and coloor \(color)")
        }
        
     
            
    struct emp{
        var name: String
        var age : Int
        
        func person(){
            print("name of person is \(name) and age \(age)" )
        }
    }
    
    struct Point {
        var x = 0.0, y = 0.0
        mutating func moveBy(x deltaX: Double, y deltaY: Double) {
            x += deltaX
            y += deltaY
        }
    }
    
    
    
}




