//
//  Enums.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 09/01/26.
//

import Foundation

class Enums {
    
    enum Directions{
        case north(move: String)
        case south(move: String)
        case east(move: String)
        case west(move: String)
        
        func description() -> String {
                switch self {
                case .north (let move): return "Up"
                case .south: return "Down"
                case .east:  return "Right"
                case .west:  return "Left"
                }
            }
    }
//    MARK: - traffic computed properties
    enum TrafficLight {
        case red, yellow, green

        var canGo: Bool {
            switch self {
            case .green:
                return true
            default:
                return false
            }
        }
    }
    
  
    
    //MARK: - Mutating
    enum SwitchState {
        case on
        case off

        mutating func toggle() {
            self = (self == .on) ? .off : .on
        }
    }
    
    enum DownloadState {
        case notStarted
        case progress(Int)   // percentage
        case finished

        mutating func updateProgress(to value: Int) {
            self = .progress(value)
        }
    }
    
    enum Mode {
        case dark
        case light

        mutating func switchMode() {
            self = .dark
        }
    }



    enum Beverage: CaseIterable {
        case coffee , tea  , juice
    }
    enum planet:Int{
        case mercury = 3,venus ,earth,mars,jupiter,saturn,uranus,neptune,pluto
    }
    enum Barcode {
        case upc(Int, Int, Int, Int)
        case qrCode(String)
    }
    enum Result {
        case success(data: String,token : String,abc : String, bcs : Int,error: String ,msg: String,sf_hdtr_id: String,sf_hdtr_nm: String,sf_hdtr_cd: String,sf_hdtr_dt:Bool)
        case failure(error: String ,msg: String)
    }
    enum MyOptional<T> {
        case none
        case some(T)
    }
    enum UserRole {
        case admin
        case guest

        var canEdit: Bool {
            self == .admin
        }
    }
    
    enum StatusCode: Int {
        case success = 200
        case notFound = 404
    }

    let code2 = StatusCode.success
    let code = StatusCode(rawValue: 250) // optional


    var a = UserRole.admin.canEdit
    enum ScreenState {
        case loading
        case success(data: String?)
        case failure(error: String)
    }
    enum APIResponse {
        case success(Int?)
        case failure
    }

    
    //MARK: - Recursive Enums
    
    indirect enum ArithmeticExpression {
        case number(Int)
        case addition(ArithmeticExpression, ArithmeticExpression)
        case multiplication(ArithmeticExpression, ArithmeticExpression)
    }
    
    indirect enum Expression {
        case number(Int)
        case addition(Expression, Expression)
    }

    
    static func evaluate(_ expr: Expression) -> Int {
        switch expr {
        case .number(let value):
            return value

        case .addition(let left, let right):
            return evaluate(left) + evaluate(right)
        }
    }


  static func barCodeExample(){
//        var barcode1: Barcode = .upc(8, 85909, 51226, 3)
//      barcode1 = Barcode.qrCode("dfs5d465s4dg4s")
//        var barcode2: Barcode = .qrCode("https://www.apple.com/")
//      barcode2 = Barcode.upc(23, 13, 45, 54)
//      print(barcode1)
//      print(barcode2)
      let five = ArithmeticExpression.number(5)
      let four = ArithmeticExpression.number(4)
      let sum = ArithmeticExpression.addition(five, four)
      let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
      
      
//      print("sum : \(sum)")
//      print("product : \(product)")
      
    }
    
    
    
//
//    let moveDirection : Directions = .north
//    //    var directionToHead = Directions.west
//    static func direction(){
//        
//        var directionToHead = Directions.south
//        
//        switch directionToHead {
//            
//        case .north:
//            print("Lots of planets have a north")
//        case .south:
//            print("Watch out for penguins")
//        case .east:
//            print("Where the sun rises")
//        case .west:
//            print("Where the skies are blue")
//        }
//    }
    
    
    
    enum Student{
        case studentName
        case studentAge
        case studentID
        case studentMarks
    }
    
    
}
