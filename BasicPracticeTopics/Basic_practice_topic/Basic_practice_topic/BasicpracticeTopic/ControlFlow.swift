//
//  ControlFlow.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 08/01/26.
//

import Foundation
import errno_h

class ControlFlow{
    var arrage = [23,43,13,43,23,42]
    
  
    func flowops(){
        var temperatureInFahrenheit = 30
        temperatureInFahrenheit = 90
        if condition(temperature: 32) {
            print("It's very cold. Consider wearing a scarf.")
        } else if condition2(temperature: 90){
            print("It's really warm. Don't forget to wear sunscreen.")
        } else {
            print("It's not that cold. Wear a T-shirt.")
        }
        
        let somePoint = (12, 100)
        if case (let x, 100) = somePoint {
            print("Found a point on the y=100 line, at \(x)")
        }
        
        func condition(temperature : Int) -> Bool{
            if temperature <= 32{
                return true
            }
            return false
        }
        func condition2(temperature : Int) -> Bool{
            if temperature >= 30{
                return true
            }
            return false
        }
        
        
//        let approximateCount = 62
//        let countedThings = "moons orbiting Saturn"
//        let naturalCount: String
//        switch approximateCount {
//        case 0:
//            naturalCount = "no"
//        case 1..<5:
//            naturalCount = "a few"
//        case 5..<12:
//            naturalCount = "several"
//        case 12..<100:
//            naturalCount = "dozens of"
//        case 100..<1000:
//            naturalCount = "hundreds of"
//        default:
//            naturalCount = "many"
//        }
//        print("There are \(naturalCount) \(countedThings).")
        
//        let somePoint = (1, 1)
//        switch somePoint {
//        case (0, 0):
//            print("\(somePoint) is at the origin")
//        case (_, 0):
//            print("\(somePoint) is on the x-axis")
//        case (0, _):
//            print("\(somePoint) is on the y-axis")
//        case (-2...2, -2...2):
//            print("\(somePoint) is inside the box")
//        default:
//            print("\(somePoint) is outside of the box")
//        }
        
        let yetAnotherPoint = (1, -1)
        switch yetAnotherPoint {
        case let (x, y) where x == y:
            print("(\(x), \(y)) is on the line x == y")
        case let (x, y) where x == -y:
            print("(\(x), \(y)) is on the line x == -y")
        case let (x, y):
            print("(\(x), \(y)) is just some arbitrary point")
        }
        
        for i in arrage where i == 23 {
            print(i)
        }
        
    }
    
    
    func flowops2(){
        var i  = 1
        
        
//        while i<=10 || i>0{
//            print(i)
//            i+=1
//        }
//
        
        
//        
//        let finalSquare = 25
//        var board = [Int](repeating: 0, count: finalSquare + 1)
//        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
//        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
//        var square = 0
//        var diceRoll = 0
//        
//        
//        repeat {
//            // move up or down for a snake or ladder
//            square += board[square]
//            // roll the dice
//            diceRoll += 1
//            if diceRoll == 7 { diceRoll = 1 }
//            // move by the rolled amount
//            square += diceRoll
//        } while square < finalSquare
//        print("Game over!")
        
        
        
        let temperatureInCelsius = 100
//        let weatherAdvice: String


//        let wetherAdvice = if temperatureInCelsius <= 0 {
//          "It's very cold. Consider wearing a scarf."
//        } else if temperatureInCelsius >= 30 {
//            "It's really warm. Don't forget to wear sunscreen."
//        } else {
//             "It's not that cold. Wear a T-shirt."
//        }
//        print(wetherAdvice)
//        
//        let freezeWarning: String? = if temperatureInCelsius >= 100 {
//          "boliing water"
//        } else {
//            nil
//        }
//        print(freezeWarning ?? "")
        
        
        let somePoint = (3, 5)
        switch somePoint {
        case (let x, 4):
            print("\(somePoint) is at the origin \(x)")
        case let(x,y) where x<y:
            print("\(somePoint) is on the x-axis")
        case (2, 4):
            print("\(somePoint) is on the y-axis")
        case (-1...1, 0...1):
            print("\(somePoint) is inside the box")
        default:
            print("\(somePoint) is outside of the box")
        }
        
        
        var score = 1
        if score < 10 {
            defer {
                print(score)
            }
            score += 5
        }
        
        
        var a = 10
        
        switch a {
        case 10:
            print("is 10")
            fallthrough
        case 0:
            print("is 10")
        case 30:
            print("isn't 10")
        default:
            print("not valid")
        }
       
        let someCharacter: Character = "b"
//        let  a:String = "a"
//        let z:String = "z"
        switch someCharacter {
        case "a", "e", "i", "o", "u":
            print("\(someCharacter) is a vowel")
        case "b"..."z"  :
            print("\(someCharacter) is a char")
        default:
            print("\(someCharacter) isn't a vowel or a consonant")
        }
        
        
    }
    
    
//    func accesToLogin(role:String){
//        var attempts = 1
//        let userRole = role
//        
//        repeat {
//            switch userRole {
//            case "admin":
//                print("Full access granted")
////                print("atempts: ",attempts)
//            case "user":
////                print("Limited access")
//            default:
////                print("No access")
//            }
//            
//            attempts += 1
//        } while attempts <= 1
//        
//    }
}

