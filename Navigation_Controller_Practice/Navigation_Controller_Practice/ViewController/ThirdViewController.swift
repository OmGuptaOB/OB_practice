//
//  ThirdViewController.swift
//  Navigation_Controller_Practice
//
//  Created by OBMac-13 on 02/02/26.
//

import UIKit

class ThirdViewController: UIViewController,UIViewControllerTransitioningDelegate,ChangeColourDelegate {
    
    func didTapChangeColor(color: UIColor, click: String) {
        self.view.backgroundColor = color
        delegate?.didTapChangeColor(color: color, click: click)
    }
    

    weak var delegate: ChangeColourDelegate?
    
    @IBOutlet weak var lblThird: UILabel!
    var str : String?
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        view.frame = CGRect(x: 10, y: 200, width: 400, height: 300)
    }
    
//    func presentationController(
//            forPresented presented: UIViewController,
//            presenting: UIViewController?,
//            source: UIViewController
//        ) -> UIPresentationController? {
//            print("func called",#function)
//            return CustomPresentationController(
//                presentedViewController: presented,
//                presenting: presenting
//            )
//        }
    
    @IBAction func btnThird(_ sender: Any) {
        let fourthVC = storyboard?.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
        fourthVC.delegate = delegate
        fourthVC.modalPresentationStyle = .pageSheet

//        let nav = UINavigationController(rootViewController: scondVC)
        
        self.navigationController?.pushViewController(fourthVC, animated: true)
//        self.present(fourthVC, animated: true)
        
    }
    override func viewDidLoad() {
        lblThird.text = str
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let array = navigationController?.viewControllers
        print(array as [UIViewController]?)
        super.viewWillAppear(animated)
    }
    

    

}
