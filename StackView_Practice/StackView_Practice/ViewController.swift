//
//  ViewController.swift
//  StackView_Practice
//
//  Created by OBMac-13 on 05/03/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupStack()
    }
    
    func setupStack(){
        let stack = UIStackView()
        let label = UILabel()
        let imageView = UIImageView()
        let button = UIButton()

        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .fill
        stack.distribution = .fill

        stack.addArrangedSubview(label)
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(button)
    }


}

