//
//  CartManager.swift
//  Cycle_Shop_practice
//
//  Created by Antigravity on 27/02/26.
//

import Foundation

struct CartItem {
    let product: Product
    var quantity: Int
}

class CartManager {
    static let shared = CartManager()
    
    private(set) var items: [CartItem] = []
    private(set) var couponDiscountFactor: Double = 0.0
    
    let deliveryFee: Double = 50.0
    
    private init() {}
    
    func applyCoupon(code: String) -> Bool {
        if code == "OB2026" {
            couponDiscountFactor = 0.26
            return true
        } else {
            couponDiscountFactor = 0.0
            return false
        }
    }
    
    func add(product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += 1
        } else {
            items.append(CartItem(product: product, quantity: 1))
        }
    }
    
    func updateQuantity(at index: Int, to quantity: Int) {
        guard index >= 0 && index < items.count else { return }
        if quantity <= 0 {
            items.remove(at: index)
        } else {
            items[index].quantity = quantity
        }
    }
    
    var subtotal: Double {
        return items.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }
    
    var productDiscountAmount: Double {
        return items.reduce(0) { acc, item in
            let discount = item.product.price * (Double(item.product.discountPercent) / 100.0)
            return acc + (discount * Double(item.quantity))
        }
    }
    
    var couponDiscountAmount: Double {
        let discountedSubtotal = subtotal - productDiscountAmount
        return discountedSubtotal * couponDiscountFactor
    }
    
    var totalDiscount: Double {
        return productDiscountAmount + couponDiscountAmount
    }
    
    var total: Double {
        return subtotal - totalDiscount + deliveryFee
    }
}
