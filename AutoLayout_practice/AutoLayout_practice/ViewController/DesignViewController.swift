//
//  DesignViewController.swift
//  AutoLayout_practice
//
//  Created by OBMac-13 on 04/02/26.
//

import UIKit

class DesignViewController: UIViewController {
    
    
    @IBOutlet weak var imageaspect1: NSLayoutConstraint!
    @IBOutlet weak var imageaspect2: NSLayoutConstraint!
    
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Oswald-Regular
//        Oswald-Regular_ExtraLight
//        Oswald-Regular_Light
//        Oswald-Regular_Medium
//        Oswald-Regular_SemiBold
//        Oswald-Regular_Bold

    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let topInset = view.safeAreaInsets.top
            let bottomInset = view.safeAreaInsets.bottom
            
//        print("Top Safe Area:", topInset)
//        print("Bottom Safe Area:", bottomInset)
        
        let safeFrame = view.safeAreaLayoutGuide.layoutFrame
//           print("Safe Area Frame:", safeFrame)
    }
    
    @IBAction func OnClickChangeImage(_ sender: Any){
        
        let tempimg = imageView1.image
        imageView1.image = imageView2.image
        imageView2.image = tempimg
        
        
        let oldAspect1 = imageaspect1.multiplier
        let oldAspect2 = imageaspect2.multiplier
        
//        print("old aspect multiplier value \(oldAspect1) and \(oldAspect2)")
        
        imageaspect1.isActive = false
        imageaspect2.isActive = false
        
        
//        print("imageview height anchor 1st :\(imageView1.heightAnchor) and 2nd : \(imageView2.heightAnchor)")
//        print("imageview width anchor 1st :\(imageView1.widthAnchor) and 2nd : \(imageView2.widthAnchor)")
        
        imageaspect1 = imageView1.widthAnchor.constraint(equalTo: imageView1.heightAnchor, multiplier: oldAspect2)
        imageaspect2 = imageView2.widthAnchor.constraint(equalTo: imageView2.heightAnchor, multiplier: oldAspect1)
        
        
        print("imageaspect value new : \(imageaspect1.multiplier) and \(imageaspect2.multiplier)")
        
        imageaspect1.isActive = true
        imageaspect2.isActive = true
        
        
        let topInset = view.safeAreaInsets.top
        let bottomInset = view.safeAreaInsets.bottom
        
//        print("Top Safe Area:", topInset)
//        print("Bottom Safe Area:", bottomInset)
        
    }
   
    

}
