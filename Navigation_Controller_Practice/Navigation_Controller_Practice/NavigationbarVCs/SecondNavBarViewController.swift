//
//  SecondNavBarViewController.swift
//  Navigation_Controller_Practice
//
//  Created by OBMac-13 on 09/02/26.
//

import UIKit

class SecondNavBarViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Second Nav Bar"
        
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "dsf", style: .plain, target: nil, action: nil)
        
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationItem.largeTitleDisplayMode = .always
        
      
        navigationItem.hidesBackButton = true
                
            let customBack = UIBarButtonItem(title: "Hello", style: .plain,target: self, action: #selector(goBack))
            
            navigationItem.leftBarButtonItem = customBack
        
        self.setupNavImage(imagename:"p1")
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func setupNavImage(imagename : String){
        let image = UIImageView(image: UIImage(named: imagename))
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 40).isActive = true
        image.widthAnchor.constraint(equalToConstant: 40).isActive = true
        image.layer.cornerRadius = 20
           image.clipsToBounds = true
        self.navigationItem.titleView = image
    }

    @IBAction func btnClickTogotoThirdVC(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ThirdNavBarViewController") as! ThirdNavBarViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("button clicked")
    }
}
