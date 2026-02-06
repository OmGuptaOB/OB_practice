//
//  PageViewController.swift
//  Basic_UI_Practice
//
//  Created by OBMac-13 on 23/01/26.
//

import UIKit

class PageViewController: UIViewController {

    override func loadView() {
        print(#function)
    }
    override func loadViewIfNeeded() {
        print(#function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        ÷self.title = "Page View Controller"
        print(#function,"page did load")
        
    }
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
        super.viewDidAppear(animated)
    }
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
        super.viewWillAppear(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
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
