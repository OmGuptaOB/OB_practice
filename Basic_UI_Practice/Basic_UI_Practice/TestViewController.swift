//
//  TestViewController.swift
//  Basic_UI_Practice
//
//  Created by OBMac-13 on 03/02/26.
//

import UIKit

class TestViewController: UIViewController {

    
    @IBOutlet weak var lblone: UILabel!
//    override func loadView() {
//        super.loadView()
////        let rootView = UIView()
////        rootView.backgroundColor = .orange
////        self.view = rootView
//        
//        print(#function)
//    }
 
    
    override func awakeFromNib() {
        print(#function)
    }
//    override func loadViewIfNeeded() {
//        print(#function)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        // Do any additional setup after loading the view.
        self.title = "test View Controller"
        print(#function,"page did load")
//        let lbl = UILabel()
//        lbl.text = "Hello, World!"
//        lbl.textColor = .white
//        view.addSubview(lbl)
         
    }
    
    @IBAction func btnShow(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Test2ViewController") as! Test2ViewController
        
        self.present(vc, animated: true)
     
        
    }
    override func viewDidAppear(_ animated: Bool) {
       
        print(#function)
        super.viewDidAppear(animated)
    }
    override func viewWillAppear(_ animated: Bool) {
//every time
        print(#function)
        super.viewWillAppear(true)
    }
    func viewIsAppearing(){
       print(#function)
   }
    override func viewWillLayoutSubviews(){
        print(#function)
    }
    override func viewDidLayoutSubviews(){
        print(#function)
    }

    override func viewWillDisappear(_ animated: Bool) {
//        every time
        print(#function)
        super.viewWillDisappear(animated)
    }
   
    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
        super.viewDidDisappear(animated)
    }
    
    
        
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        print(#function)
    }
    
    


}
