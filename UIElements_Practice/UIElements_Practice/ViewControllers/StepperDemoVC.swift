//
//  StepperDemoVC.swift
//  UIElements_Practice
//
//  Created by OBMac-13 on 12/02/26.
//

import UIKit

class StepperDemoVC: UIViewController,UITextFieldDelegate {


    @IBOutlet weak var tfInput: UITextField!
    
    @IBOutlet weak var lblvalue: UILabel!
    
    @IBOutlet weak var tfSecond: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tfInput.delegate = self
        tfSecond.delegate = self
        //        tfInput.addTarget(self,
        //                          action: #selector(textChangedLive(_:)),
        //                          for: .editingChanged)
        
    }
 
//    @objc func textChangedLive(_ textField: UITextField){
//            lblvalue.text = tfInput.text
//    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("editing begin")
        return true
    }
    
     func textFieldDidEndEditing(_ textField: UITextField){
         print("did end editing")
        lblvalue.text = tfInput.text
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("editinf end")
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    func textField(_ textField: UITextField,
                       shouldChangeCharactersIn range: NSRange,
                       replacementString string: String) -> Bool {

            if let currentText = textField.text,
               let textRange = Range(range, in: currentText) {

                let updatedText = currentText.replacingCharacters(in: textRange, with: string)
                lblvalue.text = updatedText
            }

            return true
        }
    
}

