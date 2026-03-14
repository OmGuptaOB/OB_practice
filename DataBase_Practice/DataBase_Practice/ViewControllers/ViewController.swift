//
//  ViewController.swift
//  DataBase_Practice
//
//  Created by OBMac-13 on 13/03/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfiield: UITextField!
    
    @IBOutlet weak var ageTextfiield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func BtnSave(_ sender: Any) {
        guard let name = nameTextfield.text, !name.isEmpty,
              let password = passwordTextfiield.text, !password.isEmpty,
              let age = ageTextfiield.text, !age.isEmpty else {
            showAlert(title: "Error", message: "Please fill all fields")
            return
        }
        
        let dict = ["username": name, "password": password, "age": age]
        DataBaseHelper.shareInstance.saveData(object: dict)
        showAlert(title: "Success", message: "User saved successfully!")
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
