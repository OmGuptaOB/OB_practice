//
//  ToolBarDemoVC.swift
//  UIElements_Practice
//
//  Created by OBMac-13 on 12/02/26.
//

import UIKit

class ToolBarDemoVC: UIViewController {

    @IBOutlet weak var ToolbarItem: UIToolbar!
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ToolbarItem.isTranslucent = true
        ToolbarItem.barTintColor = .systemGray6
        ToolbarItem.tintColor = .systemBlue
        
        ToolbarItem.setBackgroundImage(UIImage(named: "circle.fill"),
                                        forToolbarPosition: .any,
                                        barMetrics: .default)
        
//        ToolbarItem.toolbar.items = [done]



    }
    
    func addToolbarToTextField() {

        ToolbarItem.sizeToFit()

        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                       target: nil,
                                       action: nil)

        let done = UIBarButtonItem(barButtonSystemItem: .done,
                                   target: self,
                                   action: #selector(donePressed))

        ToolbarItem.items = [flexible, done]

        textField.inputAccessoryView = ToolbarItem
    }

    @objc func donePressed() {
        textField.resignFirstResponder()
    }

}
