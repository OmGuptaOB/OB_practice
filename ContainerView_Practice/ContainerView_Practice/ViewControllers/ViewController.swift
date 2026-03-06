//
//  ViewController.swift
//  ContainerView_Practice
//
//  Created by OBMac-13 on 03/03/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    
    enum PlanType {
        case basic
        case premium
    }
 

    private var currentVC: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        switchTo(makePlanVC(type: .basic))
    }
    
    func makePlanVC(type: PlanType) -> FirstVC {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FirstVC") as! FirstVC
        
        switch type {
        case .basic:
            vc.imageName = "Basic_Banner_image1"
            vc.descriptionText = "Basic Plan"
        case .premium:
            vc.imageName = "premium_Banner_image1"
            vc.descriptionText = "Premium Plan"
        }
        
        return vc
    }
    private func switchTo(_ newVC: UIViewController) {

        // Remove current
        if let current = currentVC {
            current.willMove(toParent: nil)
            current.view.removeFromSuperview()
            current.removeFromParent()
        }

        // Add new
        addChild(newVC)
        newVC.view.frame = containerView.bounds
        containerView.addSubview(newVC.view)
        newVC.didMove(toParent: self)
        newVC.view.frame = containerView.bounds
        newVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        currentVC = newVC
    }
    
   
    @IBAction func didTapSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            switchTo(makePlanVC(type: .basic))
          } else {
              switchTo(makePlanVC(type: .premium))
          }
    }


}

