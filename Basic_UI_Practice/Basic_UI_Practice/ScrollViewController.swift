//
//  ScrollViewController.swift
//  Basic_UI_Practice
//
//  Created by OBMac-13 on 26/01/26.
//

import UIKit

class ScrollViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        txt1.delegate = self
        txt2.delegate = self
    }
    
    @IBAction func btnclick(_ sender: Any) {
        print("click")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

extension UIViewController{
    func hideKeyboard(){
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismisskeyboard))
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismisskeyboard(){
       view.endEditing(true)
    }
}
