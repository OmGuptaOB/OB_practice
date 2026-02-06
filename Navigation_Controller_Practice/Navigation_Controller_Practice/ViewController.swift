//
//  ViewController.swift
//  Navigation_Controller_Practice
//
//  Created by OBMac-13 on 02/02/26.
//

import UIKit

class ViewController: UIViewController {
    
    
  
    override func loadView() {
        
        super.loadView()
        print(#function,"for view controller")
    }
    
    
    override func awakeFromNib() {
        print(#function,"for view controller")
    }
    
    
    override func viewDidLoad() {
       
        
      
        super.viewDidLoad()
        print(#function,"for view controller")
        // Do any additional setup after loading the view.
        
    }
  
   
    override func viewWillAppear(_ animated: Bool) {
//every time
        
     
        print(#function,"for view controller")
        super.viewWillAppear(true)
    }
    
    func viewIsAppearing(){
       print(#function,"for view controller")
   }
    
    override func viewDidAppear(_ animated: Bool) {
       
        print(#function,"for view controller")
        super.viewDidAppear(animated)
    }
   
    override func viewWillLayoutSubviews(){
        print(#function,"for view controller")
    }
    override func viewDidLayoutSubviews(){
        print(#function,"for view controller")
    }

    override func viewWillDisappear(_ animated: Bool) {
//        every time
        print(#function,"for view controller")
        super.viewWillDisappear(animated)
    }
   
    override func viewDidDisappear(_ animated: Bool) {
        print(#function,"for view controller")
        super.viewDidDisappear(animated)
    }
    
    
    
    @IBAction func btnfirst(_ sender: Any) {
        
            let secondVC = storyboard?.instantiateViewController(
                withIdentifier: "SecondViewController"
            ) as! SecondViewController
        
            
        secondVC.labelText = "Hello, World!"
        
            self.navigationController?.pushViewController(secondVC, animated: true)
        
//        self.present(secondVC, animated: true)
        print("==========================")
            print("first view crossed")
        print("==========================")
            
        }
    
 
    
    
        
        
    }
    

