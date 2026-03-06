//
//  NewViewController.swift
//  Navigation_Controller_Practice
//
//  Created by OBMac-13 on 16/02/26.
//

import UIKit
protocol ColorChangeDelegate: AnyObject {
    func changeBackgroundColor(_ color: UIColor)
}
class NewViewController: UIViewController {
    weak var delegate: ColorChangeDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeclouranddismiss(_ sender: Any) {
        delegate?.changeBackgroundColor(.systemGreen)
        self.presentingViewController?.dismiss(animated: true)
    }
    
    
    
    @IBAction func changecolourandPop(_ sender: Any) {
        delegate?.changeBackgroundColor(.systemRed)
        self.navigationController?.popViewController(animated: true)
    }
    
}
