//
//  ScondViewController.swift
//  UIElements_Practice
//
//  Created by OBMac-13 on 10/02/26.
//

import UIKit

class ScondViewController: UIViewController, UITextFieldDelegate {

    // MARK: -  IBOutlets

    //    @IBOutlet weak var Uiviewtest: UIView!
    //
    //    @IBOutlet weak var imageviewConstPf: NSLayoutConstraint!
    //
    //    @IBOutlet weak var imageViewpf: UIImageView!
    //
    //    @IBOutlet weak var viewImage: UIView!

    // MARK: - IBOutlets

    @IBOutlet weak var tfFirst: UITextField!
    @IBOutlet weak var valueFortfone: UILabel!

    @IBOutlet weak var tfSecondAge: UITextField!
    @IBOutlet weak var valueForTf2: UILabel!

    @IBOutlet weak var tfThirdView: UITextField!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        tfFirst.delegate = self
        tfSecondAge.delegate = self

        tfFirst.placeholder = "Enter your name when asked"
        tfFirst.attributedText = NSAttributedString(
            string: "",
            attributes: [
                .foregroundColor: UIColor.blue,
                .font: UIFont.boldSystemFont(ofSize: 10)
            ]
        )

        tfFirst.tintColor = .yellow

        //        tfFirst.adjustsFontSizeToFitWidth = true
        //        tfFirst.isUserInteractionEnabled = false

        // MARK: - Keyboard Types

        tfFirst.keyboardType = .emailAddress
        //        tfFirst.keyboardType = .default
        //        tfFirst.keyboardType = .twitter
        //
        //        tfFirst.keyboardType = .phonePad
        //        tfFirst.keyboardType = .numberPad
        //        tfFirst.keyboardType = .decimalPad
        //        tfFirst.keyboardType = .webSearch
        //        tfFirst.keyboardType = .asciiCapable

        // MARK: - Return Types

        //        tfFirst.returnKeyType = .done
        //        tfFirst.returnKeyType = .go
        tfFirst.returnKeyType = .next
        tfSecondAge.returnKeyType = .next
        tfThirdView.returnKeyType = .done
        //        tfFirst.returnKeyType = .search
        //        tfFirst.returnKeyType = .send
        //        tfFirst.returnKeyType = .join
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        tfFirst.attributedPlaceholder = NSAttributedString(
            string: "Enter your name",
            attributes: [
                .foregroundColor: UIColor.black,
                .backgroundColor: UIColor.systemPink
            ]
        )

        tfFirst.textAlignment = .center

        // MARK: - Password
        tfSecondAge.isSecureTextEntry = true
        
        // MARK: - TF fields format
        tfFirst.layer.borderColor = UIColor.systemPink.cgColor
        tfFirst.layer.borderWidth = 1

        tfSecondAge.layer.borderColor = UIColor.systemPink.cgColor
        tfSecondAge.layer.borderWidth = 1

        let imageView = UIImageView(image: UIImage(systemName: "person"))
        imageView.tintColor = .red
        //        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 20)

        tfFirst.leftView = imageView
        tfFirst.leftViewMode = .always

        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye"), for: .normal)

        tfSecondAge.rightView = button
        tfSecondAge.rightViewMode = .whileEditing

        //        tfSecondAge.textContentType = .password
    }

    // MARK: - UITextField Delegate

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")

        if let selectedRange = tfFirst.selectedTextRange {
            let cursorPosition = tfFirst.offset(
                from: tfFirst.beginningOfDocument,
                to: selectedRange.start
            )
            print("Cursor at index:", cursorPosition)
        }

        return true
    }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == tfFirst {
                tfSecondAge.becomeFirstResponder()
            } else if textField == tfSecondAge {
                tfSecondAge.resignFirstResponder()
            }
            return true
        }

//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if let nextField = view.viewWithTag(textField.tag + 1) as? UITextField {
//            nextField.becomeFirstResponder()
//        } else {
//            textField.resignFirstResponder()
//        }
//        return true
//    }

    // MARK: - Actions

    @IBAction func btnSubmit(_ sender: Any) {
        //        tfFirst.isUserInteractionEnabled = true

        valueFortfone.isHidden = false
        valueForTf2.isHidden = false

        valueFortfone.text = tfFirst.text
        valueForTf2.text = tfSecondAge.text
    }
}
