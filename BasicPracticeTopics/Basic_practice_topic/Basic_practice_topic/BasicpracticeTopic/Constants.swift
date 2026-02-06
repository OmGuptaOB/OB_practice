/// /
/// /  Constants.swift
/// /  Basic_practice_topic
/// /
/// /  Created by OBMac-13 on 07/01/26.


class Constants{

    let a = 10
    
//    can declare constants without assigning immidiatly
//    let name :String
//    name = "om"
//   gives error because we cannot declare a constant without assigning value
//    and stored property in a class must be initialized
//    You cannot assign to a property directly in the class body
//    since name is a let constant , swift  must garuntee that it gets a value
//   
    //solution
    var red, green, blue: Double?
//    hello
    func hello() {
        var red, green, blue: Double
        
        print("value of a : \(a)" )
        print(a)
        
    }
    

    var currentLoginAttempt = 0

    
    
//    let name: String
//    
//    init() {
//        self.name = "om"
//    }
    
    
    let accountNumber = "123456789"
        var balance = 1000.0

        func withdraw(amount: Double) {
            balance -= amount
            print(balance)
        }
    
    

    
    //
    //let Game  = "cricket "
    //var player = "Rohit"
    //var score = 100
    //var date = "26-04-2026"
    //
    //print(date)
    //print("Welcome to IPL 2026 the game of \(Game)")
    //score = score+10
    //print("score is \(score) runs by \(player)")
    //
    //player="rahul"
    //score=score+5
    //print("score is \(score) runs by \(player)")
    //
    //date="27-04-2026"
    //score=200
    //print(date)
    ////        Game="football" Cannot assign to value: 'Game' is a 'let' constant
    //print("Welcome to IPL 2026 the game of \(Game)")
    //player="subham"
    //score = score+11
    //print("score is \(score) runs by \(player)")
    //
    //player="rinku"
    //score=score+5
    //print("score is \(score) runs by \(player)")
}

