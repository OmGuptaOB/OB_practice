//
//  DesignViewController.swift
//  Navigation_Controller_Practice
//
//  Created by OBMac-13 on 16/02/26.
//

import UIKit

class DesignViewController: UIViewController,ColorChangeDelegate {
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        addCornertoView(view1, radius: 10)
        addCornertoView(view2, radius: 20)
        view2.clipsToBounds = false
        view2.layer.masksToBounds = true
        applyStyle(
            to: [view1, view2, view3, view4, view5],
            cornerRadius: 10,
            borderWidth: 2,
            borderColor: .black,
            shadowColor: .darkGray,
            shadowOpacity: 1,
            shadowOffset: CGSize(width: 2, height: 2),
            shadowRadius: 4
        )

    }
    func applyStyle( to views: [UIView], cornerRadius: CGFloat, borderWidth: CGFloat,  borderColor: UIColor,shadowColor: UIColor,shadowOpacity:Float,shadowOffset: CGSize,shadowRadius: CGFloat
         ) {
                                 
        for view in views {
              view.layer.cornerRadius = cornerRadius
               view.layer.borderWidth = borderWidth
                view.layer.borderColor = borderColor.cgColor
                 view.layer.shadowColor = shadowColor.cgColor
                 view.layer.shadowOpacity = shadowOpacity
                  view.layer.shadowOffset = shadowOffset
                 view.layer.shadowRadius = shadowRadius
                                     
               }
 }

    
    @IBAction func btnGotonext(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "NewViewController") as! NewViewController
        vc.delegate = self
        self.present(vc, animated: true)

//        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    func changeBackgroundColor(_ color: UIColor) {
        self.view.backgroundColor = color
    }

    
}


func addCornertoView(_ view: UIView, radius: CGFloat) {
    view.layer.cornerRadius = radius
    view.clipsToBounds = true
}


func addBordertoView(_ view: UIView, borderColor: UIColor, borderWidth: CGFloat) {
    view.layer.borderColor = borderColor.cgColor
    view.layer.borderWidth = borderWidth
}
