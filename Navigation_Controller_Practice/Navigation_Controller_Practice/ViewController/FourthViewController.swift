//
//  FourthViewController.swift
//  Navigation_Controller_Practice
//
//  Created by OBMac-13 on 02/02/26.
//

import UIKit

class FourthViewController: UIViewController {
    
    weak var delegate : ChangeColourDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let array = navigationController?.viewControllers
        print(array as [UIViewController]?)
        super.viewWillAppear(animated)
    }
    
    @IBAction func btnFourth(_ sender: Any) {
        //MARK: - Second way to go
        
//        self.navigationController?.popToRootViewController(animated: true)
    self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        

        //MARK: - Another way to go
        
        //        var multiVc = self.navigationController?.viewControllers
        //        multiVc?.remove(at: 2)
        //        self.navigationController?.viewControllers = multiVc!
        //        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BtnOnClickGotoSecondScreen(_ sender: Any) {
        
        //MARK: - First way to go if using present
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        
    
        
        //MARK: - Third way to go
        
        
        //MARK: - First
        
//        let thirdVc = self.navigationController?.viewControllers[1]
//        
//        var vc = thirdVc?.isKind(of: SecondViewController.classForCoder())
//        
//        if (vc!){
//            
//            navigationController?.popToViewController(thirdVc!, animated: true)
//        }else{
//            navigationController?.popToRootViewController(animated: true)
//        }
//        
        
        //MARK: - Second
        //        fails if second vc moves from stack index
        
        //        let thirdVc = self.navigationController?.viewControllers as! SecondViewController
        //        self.navigationController?.popToViewController(thirdVc, animated: true)
        
    }
    
    
    @IBAction func btnOnClickChangeFirstVCColor(_ sender: Any) {
        let click = "cliickerd from fouth"
        delegate?.didTapChangeColor(color: UIColor.black,click: click)
    }
    
    
}
