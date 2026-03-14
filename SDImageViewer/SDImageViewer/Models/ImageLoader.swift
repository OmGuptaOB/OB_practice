//
//  ImageLoader.swift
//  SDImageViewer
//
//  Created by OBMac-13 on 12/03/26.
//

import Foundation
import UIKit

class ImageLoader {

    static let shared = ImageLoader()

    private let cache = NSCache<NSString, UIImage>()

    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {

        // 1. Check cache
        if let cachedImage = cache.object(forKey: urlString as NSString) {
            completion(cachedImage)
            return
        }

        // 2. Create URL
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        // 3. Download image
        URLSession.shared.dataTask(with: url) { data, _, _ in

            guard let data = data,
                  let image = UIImage(data: data) else {

                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }

            // 4. Save to cache
            self.cache.setObject(image, forKey: urlString as NSString)

            // 5. Return image on main thread
            DispatchQueue.main.async {
                completion(image)
            }

        }.resume()
    }
}
