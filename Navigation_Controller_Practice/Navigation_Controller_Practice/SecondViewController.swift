//
//  SecondViewController.swift
//  Navigation_Controller_Practice
//
//  Created by OBMac-13 on 02/02/26.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var labelout: UILabel!
    var labelText: String?
    
    override func loadView() {
        super.loadView()
        print(#function,"for secondview controller")
    }
    
    
    override func awakeFromNib() {
        print(#function,"for secondview controller")
    }
    
    override func viewDidLoad() {
        
        labelout.text = labelText
        super.viewDidLoad()
        print(#function,"for secondview controller")
        // Do any additional setup after loading the view.
        
    }

    override func viewWillAppear(_ animated: Bool) {
        //every time
        print(#function,"for secondview controller")
        super.viewWillAppear(true)
    }
    
    func viewIsAppearing(){
       print(#function,"for secondview controller")
   }
    
    override func viewDidAppear(_ animated: Bool) {
       
        print(#function,"for secondview controller")
        super.viewDidAppear(animated)
    }
   
    override func viewWillLayoutSubviews(){
        print(#function,"for secondview controller")
    }
    override func viewDidLayoutSubviews(){
        print(#function,"for secondview controller")
    }

    override func viewWillDisappear(_ animated: Bool) {
//        every time
        print(#function,"for secondview controller")
        super.viewWillDisappear(animated)
    }
   
    override func viewDidDisappear(_ animated: Bool) {
        print(#function,"for secondview controller")
        super.viewDidDisappear(animated)
    }
    
  
    
    @IBAction func btnSecond(_ sender: Any) {
        let thirdVC = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        
        
        self.navigationController?.popViewController(animated: true)
        
//        self.dismiss(animated: true, completion: nil)
        
        print("==========================")
        print("second view dismised")
        print("==========================")
    }
   

}
