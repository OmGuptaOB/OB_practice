//
//  Initialization.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 08/01/26.
//

import Foundation



    
    struct Celsius {
        var temperatureInCelsius: Double
        init(fromFahrenheit fahrenheit: Double) {
            temperatureInCelsius = (fahrenheit - 32.0) / 1.8
        }
        init(fromKelvin kelvin: Double) {
            temperatureInCelsius = kelvin - 273.15
        }
        init(_ celsius : Double){
            temperatureInCelsius = celsius
        }
    }
    let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
    // boilingPointOfWater.temperatureInCelsius is 100.0
    let freezingPointOfWater = Celsius(fromKelvin: 273.15)
    // freezingPointOfWater.temperatureInCelsius is 0.0
    let celciusvalue = Celsius(3.4)
    
    //default init
    
    //    struct ShoppingListItem {
    //        var name: String
    //        var quantity : Int
    //        var purchased : Bool
    //    }
    class Vehicle {
        var numberOfWheels = 0
        var description: String {
            return "\(numberOfWheels) wheel(s)"
        }
        init(numberOfWheels: Int) {
            self.numberOfWheels = numberOfWheels
        }
    }
    
    class Bicycle: Vehicle {
       
        init(){
            super.init(numberOfWheels: 20)
        }
    }
//class hoverboard : Vehicle {
//    var color : String
//    init(color: String) {
//        self.color = color
//    }
//    
//    override var description: String{
//        return "\(super.description) hoverboard in \(color)"
//    }
//    }
//    
    class Food {
        var name: String
        var country : String? = "Local"
        init(name: String) {
            self.name = name
        }
        convenience init() {
            self.init(name: "[Unnamed]")
        }
    }

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

class User {

    var name: String
    var age: Int
    var email: String

    init(){
        self.name = ""
        self.age = 0
        self.email = ""
    }
    
    // 1️⃣ DESIGNATED initializer
    init(name: String, age: Int, email: String) {
        self.name = name
        self.age = age
        self.email = email
    }

    // 2️⃣ CONVENIENCE initializer (uses default age)
    convenience init(name: String, email: String) {
        self.init(name: name, age: 18, email: email)
    }

    // 3️⃣ FAILABLE DESIGNATED initializer
    init?(name: String, age: Int) {
        if name.isEmpty || age < 0 {
            return nil
        }
        self.name = name
        self.age = age
        self.email = "not_provided@email.com"
    }

    // 4️⃣ FAILABLE CONVENIENCE initializer
    convenience init?(name: String) {
        if name.count < 3 {
            return nil
        }
        self.init(name: name, age: 18)
    }
}


   

