//
//  ViewController.swift
//  Basic_UI_Practice
//
//  Created by OBMac-13 on 22/01/26.
//

import UIKit

class ViewController: UIViewController {

    
    override func loadView() {
        print(#function,"called")
    }
    var bgColor: UIColor = .black
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .green
        self.view.backgroundColor = bgColor
        navigationItem.backButtonTitle = "home"
    }
    @IBAction func btnClear(_ sender: Any) {
        txtinput.text = ""
    }
    @IBAction func btnshow(_ sender: Any) {
        
        if let text = txtinput.text, !text.isEmpty {
                   lbl.text = text
               } else {
                   lbl.text = "Please enter text"
               }
    }
    @IBAction func goToPage(_ sender: Any) {
        
        let pageVC = PageViewController()
        
        self.navigationController?.pushViewController(pageVC, animated: false)

    }
    
    @IBOutlet weak var txtinput: UITextField!
    
    @IBOutlet weak var lbl: UILabel!
//    @IBOutlet weak var lbl2: UILabel!

    var counter = 1
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function,counter)
        counter+=1
        
        let color = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
//        view.backgroundColor = color
        self.title = "Basic UI Practice with color:\(color.accessibilityName)"
//        view.addSubview(lbl)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(#function)
        super.viewWillDisappear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
        super.viewDidDisappear(animated)
    }
        
    override func loadViewIfNeeded() {
        super.loadViewIfNeeded()
        print(#function)
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        print(#function)
    }
}

