//
//  Structures.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 08/01/26.
//

import Foundation
class StructuresClass{
    
    class User {
        var name : String
        
        var account : Account
        init(name: String) {
            self.name = name
            self.account = Account()
            
        }
        
    }
    struct Account {
        var balance : Double = 0.0
        mutating func deposit(amount : Double){
            balance += amount
        }
    }
//    struct NewAccount : Account{
//        Inheritance from non-protocol type 'StructuresClass.Account'
//    }
        
        
    }
    
  


