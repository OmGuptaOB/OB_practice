//
//  ViewController.swift
//  LoginScreenDemo
//
//  Created by OBMac-13 on 14/02/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var rememberMeBtn: UIButton!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupelements()
    }
    
    func setupelements(){
        
        tfEmail.placeholder = " | enter Email"
        tfPassword.placeholder = " | enter Email"
        
        tfEmail.font = UIFont.systemFont(ofSize: 14)
        tfPassword.font = UIFont.systemFont(ofSize: 14)
        
        
        let imageView = UIImageView(image: UIImage(systemName: "envelope"))
        imageView.tintColor = .gray
        
        let imageView2 = UIImageView(image: UIImage(systemName: "key"))
        
        imageView.tintColor = .gray

        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.addTarget(self, action: #selector(changeEye), for: .touchUpInside)

        tfPassword.rightView = button
        tfPassword.rightViewMode = .whileEditing

        tfEmail.leftView = imageView
        tfPassword.leftView = imageView2
        tfEmail.leftViewMode = .always
        tfPassword.leftViewMode = .always
        
        rememberMeBtn.setImage(UIImage(systemName: "square"), for: .normal)
        rememberMeBtn.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
//        rememberMeBtn.setTitleColor(, for: .selected)
        
        rememberMeBtn.addTarget(self, action: #selector(checkboxTapped), for: .touchUpInside)
        
        btnLogin.layer.cornerRadius = 16
        
    }
    
    
    
    @objc func checkboxTapped(_ sender: UIButton){
        sender.isSelected.toggle()

    }
    
    @objc func changeEye(_ sender: UIButton){
        
        sender.setImage(UIImage(named: "eye.slash"), for: .normal)
    }
}

