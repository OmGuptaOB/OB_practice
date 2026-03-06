//
//  ImagePageViewController.swift
//  Cycle_Shop_practice
//
//  Created by OBMac-13 on 25/02/26.
//

import UIKit

class ImagePageViewController: UIViewController {
    
    var image: UIImage?
    
    private let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.frame = view.bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        
        view.addSubview(imageView)
    }
}
