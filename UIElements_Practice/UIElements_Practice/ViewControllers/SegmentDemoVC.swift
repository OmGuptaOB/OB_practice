//
//  SegmentDemoVC.swift
//  UIElements_Practice
//
//  Created by OBMac-13 on 12/02/26.
//

import UIKit

class SegmentDemoVC: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var secondView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegment()
        firstView.isHidden = false
           secondView.isHidden = true
//        segment.addTarget(self,
//                          action: #selector(segmentChanged(_:)),
//                          for: .valueChanged)
        
        
    }
    func setupSegment(){
        segment.removeAllSegments()
        segment.insertSegment(withTitle: "Login", at: 0, animated: true)
        segment.insertSegment(withTitle: "SignUp", at: 1, animated: true)
        
//        segment.selectedSegmentIndex = -1
//        segment.isMomentary = true
        segment.selectedSegmentTintColor = .systemPink
        segment.setTitleTextAttributes(
            [.foregroundColor: UIColor.white,
             .font: UIFont.boldSystemFont(ofSize: 16)],
            for: .selected
        )
        
//        segment.setContentOffset(CGSize(width: 5, height: 0), forSegmentAt: 0)

//        segment.setBackgroundImage(UIImage(named: "pic"),
//                                   for: .normal,
//                                   barMetrics: .default)
//        
//        segment.backgroundImage(for: .normal, barMetrics: .default)
        
//        segment.setDividerImage(UIImage(named: ""),
//                                forLeftSegmentState: .normal,
//                                rightSegmentState: .normal,
//                                barMetrics: .default)
        
//        segment.setWidth(200, forSegmentAt: 1)





    }
    
//    @objc func segmentChanged(_ sender: UISegmentedControl) {
//        switch sender.selectedSegmentIndex {
//        case 0:
//            print("First selected")
//        case 1:
//            print("Second selected")
//        default:
//            break
//        }
//    }

    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
                firstView.isHidden = false
                secondView.isHidden = true
            } else {
                firstView.isHidden = true
                secondView.isHidden = false
            }
    }
    
    

}
