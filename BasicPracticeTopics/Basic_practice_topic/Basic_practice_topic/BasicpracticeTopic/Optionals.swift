//
//  Optionals.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 07/01/26.
//
class Optionals {

    var city: String
    var country: String?   // optional
    var score: Int?        // optional

    init() {
        self.city = "Surat"
        self.country = nil
        self.score = nil
    }


    func printScore() {
        if let score = score {
            print("Score is \(score)")
        } else {
            print("Score is nil")
        }
        
        let possibleNumber = "123"
        if let actualNumber = Int(possibleNumber) {
            print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
        } else {
            print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
        }
        
        
        var rawScore = 100
        var bonus: Int? = 50
        var finalScore: Int? = nil

        // Line A
        finalScore = rawScore + bonus!

        // Line B
        let message = "Score is: \(finalScore!)"
    }
   
}

