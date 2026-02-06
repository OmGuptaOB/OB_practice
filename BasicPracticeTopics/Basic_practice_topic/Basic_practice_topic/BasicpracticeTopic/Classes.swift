//
//  ClassesStructs.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 08/01/26.
//

import Foundation


//struct Packet {
//    var id = 500
//}
//class Session {
//    var id = 500
//}

var message : String?
class Classes {
   
    class Newclass{
        let prop : Int
        init(prop: Int) {
            self.prop = prop
     
        }
        
        
    }
    func clsArray(){
        
        var arrcls : [Newclass] = [Newclass(prop: 32),Newclass(prop: 34),Newclass(prop: 15)]
        
        
//            if let var
           
//            if let foundClass = arrcls.first(where: { $0.prop == 34 }) {
//                print(" Found : \(foundClass.prop)")
//            } else {
//                print("not found.")
//            }
        
        let v = arrcls.count(where: { $0.prop > 15 })
        let vari  = arrcls.filter { newcls in
            return newcls.prop > 15
        }
        print(vari)
        print(v)
        
    }
    
    
    class Shoppingitems{
        
        var itemname: String
        var price: Double
        var categor: ShoppingCategory
        
        init(itemname: String, price: Double, categor: ShoppingCategory) {
            self.itemname = itemname
            self.price = price
            self.categor = categor
        }
        
    }
    enum ShoppingCategory{
        case fruits
        case cloth
        case kitchenitems
        case grocery
    }
    
    static func clsarr(){
        var newiteem =
        [
            Shoppingitems(itemname: "apple", price: 0.1, categor: .fruits)
         ,Shoppingitems(itemname: "banana", price: 1.4, categor: .fruits)
         ,Shoppingitems(itemname: "tshirt", price: 20,categor: .cloth)
        ]
        
        let filterfood = newiteem.filter { $0.categor == .fruits }
        print("food items are: \(filterfood)")
        
        let fruitsandcloth = newiteem.filter {
            $0.categor == .fruits || $0.categor == .cloth
        }
        
        let foodandprice = newiteem.filter{$0.price >= 1 && ($0.categor == .fruits || $0 .categor == .cloth)}
        print("fruits and cloths are:\(foodandprice)")
    }
}




// Line A



