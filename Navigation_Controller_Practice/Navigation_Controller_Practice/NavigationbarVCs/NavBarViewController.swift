//
//  NavBarViewController.swift
//  Navigation_Controller_Practice
//	
//  Created by OBMac-13 on 09/02/26.
//

import UIKit

class NavBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .white
        self.navigationItem.title = "NavBAR"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(didTapButton))
        
        self.navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.backButtonDisplayMode = .minimal

    }
    
    
    
    @objc func didTapButton() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondNavBarViewController") as! SecondNavBarViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("button clicked")
    }
    
    @IBAction func onClickGotoSecondScreen(_ sender: Any) {
        didTapButton()
    }
    

}
