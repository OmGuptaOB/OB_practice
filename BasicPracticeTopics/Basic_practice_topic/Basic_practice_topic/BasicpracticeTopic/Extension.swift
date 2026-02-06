//
//  Extension.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 19/01/26.
//

import Foundation
import UIKit




extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

extension Int {
    func isEven() -> Bool {
        return 43 % 2 == 0
    }
}

struct Userex {
    let name: String
}


extension Userex {
    init() {
        self.name = "Guest"
    }
}


extension Collection where Element == String {
    func alphabetize() -> [String] {
        return self.sorted { $0 < $1 }
    }
}




extension Int {
    mutating func square() {
        self = self * self
    }
}
struct Person {
    let name: String
}

//extension Person {
//    var age: Int = 20  //Extensions must not contain stored properties
//}
extension Double {
    var kkm: Double {
        1 * 1000
    }
}


    
var arrayName = ["Om","Rahul","Amit","Rohit","Shubham","Vivek","Prateek","Kunal","Ankit","Jatin"]
var newarr = [1,2,3,5,2,5,1,9,3,5,82]

class Extensionclass{
    
    
    
    static func checktype() {
        
        var num = 23
        var num2 = 2.kkm
      
        num.square()
       
        print("Num",num2)
          print(arrayName.alphabetize())

          let name = Userex()
          print(name.name)

          print(num.isEven())

          let oneInch = 25.4.km
          print("One inch is \(oneInch) meters")

          let threeFeet = 3.ft
          print("Three feet is \(threeFeet) meters")
      }

   

}



