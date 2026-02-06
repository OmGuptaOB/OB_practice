//
//  ErrorHand.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 16/01/26.
//

import Foundation

class ErrorHand {
   
    //MARK: - Example 1
    
    // 1) Define the possible errors
    enum SandwichError: Error {
        case outOfCleanDishes
        case missingIngredients([String])
    }

    // 2) A function that may throw
    static func makeASandwich() throws {
        // Imagine you check dishes and groceries here
        throw SandwichError.missingIngredients(["tomato","cheese","bread"])
    }

    // 3) Supporting functions
    static func eatASandwich() {
        print("Sandwich eaten!")
    }

    static func washDishes() {
        print("Washing dishes before making sandwich...")
    }

    static func buyGroceries(_ ingredients: [String]) {
        print("Going to buy:", ingredients)
    }
    
    
    //MARK: - Example 2
    enum BikeEror: Error {
        case flatTire
        case brokenChain
        case noFuel
    }
    enum EngineError : Error {
        case oilLeak
        case sparkPlugFault
    }
    
    static func rideBike(fuellevel : Int) throws(BikeEror) {
        
        var fuel = fuellevel
        print("riding bike and ....")
        for km in 10...50{
            if fuel == 0{
                print("fuel low")
                throw BikeEror.flatTire
            }
            print("traveld \(km) km in fuel of \(fuel) litres")
            fuel-=1
        }
        
        throw BikeEror.flatTire
    }
    
    
    static func CheckEngine() throws(any Error){
        print("checking ")
    }
    
//    static func startEngine() throws(Never){
//        print("engine started")
//        throw BikeEror.brokenChain
////        Thrown expression type 'ErrorHand.BikeEror' cannot be converted to error type 'ErrorHand.EngineError
//    }
    
    static func ridecomplete(){
        print("ride complete")
    }
    
    static func fixflatTire(){
        print("flat tire fixed")
    }
    static func fillFuel(){
        print("fuel filled")
    }
    static func replaceChain(){
        print("chain replaced")
    }

    
   

}
