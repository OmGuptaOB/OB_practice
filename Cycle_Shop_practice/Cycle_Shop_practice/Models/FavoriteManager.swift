//
//  FavoriteManager.swift
//  Cycle_Shop_practice
//
//  Created by Antigravity on 27/02/26.
//

import Foundation

class FavoriteManager {
    static let shared = FavoriteManager()
    private let favoritesKey = "liked_product_ids"
    
    private init() {}
    
    func save(productId: String, isLiked: Bool) {
        var likedIDs = getLikedIDs()
        if isLiked {
            likedIDs.insert(productId)
        } else {
            likedIDs.remove(productId)
        }
        UserDefaults.standard.set(Array(likedIDs), forKey: favoritesKey)
    }
    
    func getLikedIDs() -> Set<String> {
        let array = UserDefaults.standard.stringArray(forKey: favoritesKey) ?? []
        return Set(array)
    }
}
