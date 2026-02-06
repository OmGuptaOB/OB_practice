//
//  ElectricityBill.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 26/01/26.
//

import Foundation

func electricityBill(_ units: Double,_ coupon : String? = "") throws ->  (msg : String,amount : Float) {
    
    
    
    var unitPrice: Double
    var totalAmount : Float = 0.0
    
    if units <= 0 {
        throw BillError.invalidunit
    }else if coupon == nil{
        throw BillError.invalidCouponCode
    }
     let rate1 = 10.0
     let rate2 = 15.0
     let rate3 = 20.0
     let rate4 = 25.0
     let rate5 = 30.0
    
    var totalunits = units
   if (units > 0 && units != 0)  {
       switch units {
           case 1...50 :
               unitPrice = 10
           case 51...150:
               unitPrice = 15
           case 151...200:
               unitPrice = 20
       case 201...300:
               unitPrice = 25
           default:
               unitPrice = 30
       }
       
//       //slab based
//       if units >= 0 {
//           let  unitinslab = min(units,50)
//           let cost = rate1 * unitinslab
//           totalAmount += Float(cost)
//           totalunits -= unitinslab
//       }
//       
//       if units >= 0 {
//           let  unitinslab = min(units,100)
//           let cost = rate2 * unitinslab
//           totalAmount += Float(cost)
//           totalunits -= unitinslab
//       }
//       
//       if units >= 0 {
//           let  unitinslab = min(units,200)
//           let cost = rate3 * unitinslab
//           totalAmount += Float(cost)
//           totalunits -= unitinslab
//       }
//       if units >= 0 {
//           let  unitinslab = min(units,totalunits)
//           let cost = rate5 * unitinslab
//           totalAmount += Float(cost)
//           totalunits -= unitinslab
//       }
//       
       
       
       totalAmount  = Float(unitPrice * units)
       
       if let code = coupon?.trimmed() {
           switch code {
           case CouponCode.save30.rawValue:
               return ("Discounted BiLL",totalAmount * 0.7)
           default:
               return ("Non discounted BiLL",totalAmount)
           }
       }
   }
    
    return ("your Total BiLL",totalAmount)
    
}

enum CouponCode : String {
    case save30 = "@#$123456"
}
enum BillError : String, Error {
    case invalidunit = "ener units should be greater than zero"
    case invalidCouponCode = "Invalid coupon code"
}

//func applydiscount(billAmount : Double, coupon : String?) -> Float{
//    
//    if let code = coupon {
//        switch code {
//        case CouponCode.save30.rawValue:
//            return Float(billAmount * 0.7)
//        default:
//            return Float(billAmount)
//        }
//    }
//    return Float(billAmount)
//}


