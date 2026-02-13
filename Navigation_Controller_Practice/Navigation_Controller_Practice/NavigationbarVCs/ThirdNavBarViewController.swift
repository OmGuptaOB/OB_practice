//
//  ThirdNavBarViewController.swift
//  Navigation_Controller_Practice
//
//  Created by OBMac-13 on 09/02/26.
//

import UIKit

class ThirdNavBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func btnclicktoGotoFourthVC(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FourthNavBarViewController") as! FourthNavBarViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
