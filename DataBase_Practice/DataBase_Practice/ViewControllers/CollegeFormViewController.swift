//
//  CollegeFormViewController.swift
//  DataBase_Practice
//
//  Created by OBMac-13 on 13/03/26.
//

import UIKit

class CollegeFormViewController: UIViewController {
    
    
    @IBOutlet weak var collageName: UITextField!
    
    @IBOutlet weak var collegeUniversity: UITextField!
    
    @IBOutlet weak var collegeCity: UITextField!
    
    @IBOutlet weak var collegeAddress: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collageName.delegate = self
        collegeUniversity.delegate = self
        collegeCity.delegate = self
        collegeAddress.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
}

extension CollegeFormViewController {
    @IBAction func btnSave(_ sender: Any) {
        saveCollegeDetail()
    }
    
    
}
extension CollegeFormViewController : UITextFieldDelegate{
    func saveCollegeDetail(){
        guard let cname = collageName.text, !cname.isEmpty,
              let ccollegeuniversity = collegeUniversity.text, !ccollegeuniversity.isEmpty,
              let ccity = collegeCity.text, !ccity.isEmpty,
              let caddress = collegeAddress.text, !caddress.isEmpty else {
            
           
            showAlert(title: "Error", message: "Please fill all fields")
            return
        }
        let dict = ["collagename": cname, "collegeuniversity": ccollegeuniversity, "collegecity": ccity, "collegeaddress": caddress]
        DataBaseHelper.shareInstance.saveCollegeData(object: dict)
        showAlert(title: "Success", message: "College saved successfully!")
        
        collageName.text = ""
        collegeUniversity.text = ""
        collegeCity.text = ""
        collegeAddress.text = ""
        
        
    }
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == collageName {
            collegeUniversity.becomeFirstResponder()
        }else if textField == collegeUniversity {
            collegeCity.becomeFirstResponder()
        }else if textField == collegeCity {
            collegeAddress.becomeFirstResponder()
        } else{
            collegeAddress.resignFirstResponder()
        }
    }
}
