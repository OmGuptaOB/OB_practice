//
//  FourthNavBarViewController.swift
//  Navigation_Controller_Practice
//
//  Created by OBMac-13 on 09/02/26.
//

import UIKit

class FourthNavBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        view.frame = CGRect(x: 10, y: 200, width: 400, height: 300)
    }
    
    
    @IBAction func btnClickBackToHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    

    @IBAction func btnClickBacktoSecondScreen(_ sender: Any) {
        let vc = navigationController?.viewControllers[1] as! SecondNavBarViewController
        
        self.navigationController?.popToViewController(vc, animated: true)
    }
    

}
