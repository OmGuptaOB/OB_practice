//
//  DecriptonVC.swift
//  TableViewDemo
//
//  Created by OBMac-13 on 13/02/26.
//

import UIKit

class DecriptonVC: UIViewController {

    @IBOutlet weak var imgView: UIImageView!

    @IBOutlet weak var prodDesc: UILabel!
    
    @IBOutlet weak var titleUser: UILabel!
    
    var titleprod : String!
    var desc : String!
    var imag : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        imgView.image = imag
        titleUser.text = titleprod
        prodDesc.text = desc
    }
}
