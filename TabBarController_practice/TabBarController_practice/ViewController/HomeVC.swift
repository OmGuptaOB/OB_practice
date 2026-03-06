//
//  homeVC.swift
//  TabBarController_practice
//
//  Created by OBMac-13 on 05/03/26.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
    
    var count = 0

    @IBAction func increment(_ sender: UIButton) {
        count += 1
        lbl.text = "\(count)"
    }
}
