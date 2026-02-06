//
//  ThirdViewController.swift
//  Navigation_Controller_Practice
//
//  Created by OBMac-13 on 02/02/26.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBAction func btnThird(_ sender: Any) {
        let fourthVC = storyboard?.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
//        let nav = UINavigationController(rootViewController: scondVC)
        
        self.navigationController?.pushViewController(fourthVC, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
