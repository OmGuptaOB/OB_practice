//
//  Inheritence.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 16/01/26.
//

import Foundation
class Inheritence{
//    class Vehicle
//    {
//        
//        var speed : Int
//        var noofwheels : Int
//        var description : String{
//            
//            "goin at a speed of \(speed)km/ph"
//            
//        }
//        
//        var modelnumber : String{
//            return modelnumber
//        }
//        
//        func makenoise(){
//            print("honk honk .... !")
//        }
//        
//        init(_ speed: Int, wheels noofwheels :Int) {
//            self.speed = speed
//            self.noofwheels = noofwheels
//        }
//        
//        
//    }
//   
//    class Bike : Vehicle{
//        
//       
//        var isHelmetworn : Bool
//        var isPetrolThere : Bool
//      
//        init(speed speed: Int,wheels noofwheels :Int,isHelmetworn: Bool, isPetrolThere: Bool) {
//            self.isHelmetworn = isHelmetworn
//            self.isPetrolThere = isPetrolThere
//            super.init(_:speed, wheels: noofwheels)
//            
//            self.makenoise()
//            func newwork(){
//                self.speed += 10
//            }
//            newwork()
//            payfine(ishelmet: isHelmetworn)
//        }
//        
//        override convenience init(_ speed: Int,wheels noofwheels :Int){
//            self.init(speed: speed, wheels: noofwheels, isHelmetworn: true,isPetrolThere:true )
//        }
//        override var description: String{
//            "\(super.description) and has \(noofwheels) wheels"
//        }
//        func payfine(ishelmet: Bool){
//            
//            
//            if !isHelmetworn{
//                print("pay fine cuz helmet nt worn")
//               
//            }else{
//                print("go seamlessly")
//            }
//        }
//    
//    }
//    
//    
//    class Bicycle : Bike{
//        override func makenoise() {
//            print("ring ring")
//        }
//       
//        
//        override var description: String{
//            super.makenoise()
//            super.speed = 15
//            return "\(super.speed) make sure to ride safe go at a safe speed"
//        }
//    }
//    

    
    class Account {
        var balance: Double = 0.0

        var summary: String {
            return "Balance is ₹\(balance)"
        }
    }

    class SavingsAccount: Account {
        var interestRate: Double = 0.05

        override var summary: String {
            return super.summary + " with interest rate \(interestRate * 100)%"
        }
    }

    class AuditedSavingsAccount: SavingsAccount {
        override var balance: Double {
            didSet {
                print("Balance changed from ₹\(oldValue) to ₹\(balance)")
            }
        }
    }

    
    class Device {
        var status: String {
            return "Offline"
        }
    }

    class SmartDevice: Device {
        private var internalStatus = "Offline"

        override var status: String {
            get {
                internalStatus
            }
            set {
                internalStatus = newValue
            }
        }
        
    }
    
    class NewSmartDevice: SmartDevice {
        
    }


   
    
    
}
class Circle{
    var radius : Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    
}


extension String{
    
    func trimmed() -> String{
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    mutating func trim(){
        self = self.trimmed()
    }
}

extension Circle{
    var area : Double{
        return .pi * radius * radius
    }
    
    convenience init(radi: Double){
        self.init(radius: radi * 4)
    }
    
}

    
