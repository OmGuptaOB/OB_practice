//
//  Product.swift
//  Cycle_Shop_practice
//
//  Created by Antigravity on 26/02/26.
//

import Foundation

struct ProductResponse: Codable {
    let products: [Product]
}

struct Product: Codable {
    let id: String
    let category: String
    let name: String
    let price: Double
    let discountPercent: Int
    let discountedPrice: Double
    var isLiked: Bool
    let badge: String?
    let thumbnail: String
    let images: [String]
    let description: String
    let specifications: [String: String]   // ← dictionary, handles any keys

    enum CodingKeys: String, CodingKey {
        case id, category, name, price, badge, thumbnail, images, description, specifications
        case discountPercent  = "discount_percent"
        case discountedPrice  = "discounted_price"
        case isLiked          = "is_liked"
    }
}
