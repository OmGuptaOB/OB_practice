//
//  DataViewController.swift
//  PageViewController_Practice
//
//  Created by OBMac-13 on 18/02/26.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var lblData: UILabel!
    
    var dataTodisplay : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblData.text = dataTodisplay
    }
}
