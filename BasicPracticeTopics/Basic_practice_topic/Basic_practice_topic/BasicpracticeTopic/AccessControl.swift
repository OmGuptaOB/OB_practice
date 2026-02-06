//
//  AccessControl.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 20/01/26.
//

import Foundation

// Model
class AccessControl {
    
    private var password: String
    internal var username: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    func validatePassword(_ input: String) -> Bool {
        return input == password
    }
    
    open class AnimalClass {
        open func makeSound() {
            print("Animal sound")
        }
    }
    public class CarClass {
        public func drive() {}
    }
    class PersonClass {
        var name: String = ""
        fileprivate var cache = 0
        func fetchUser(){
                
        }
        

    }


    
}
