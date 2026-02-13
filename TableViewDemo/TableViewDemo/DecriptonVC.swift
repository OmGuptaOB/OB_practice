//
//  DecriptonVC.swift
//  TableViewDemo
//
//  Created by OBMac-13 on 13/02/26.
//

import UIKit

class DecriptonVC: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var prodTitle: UILabel!
    
    @IBOutlet weak var prodDesc: UILabel!
    
   
    var desc : String!
    var imag : UIImage!
    var titleprod : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = imag
        prodDesc.text = desc
        prodTitle.text = titleprod
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
