//
//  SecondViewController.swift
//  Navigation_Controller_Practice
//
//  Created by OBMac-13 on 02/02/26.
//

import UIKit


class SecondViewController: UIViewController, UIViewControllerTransitioningDelegate {
  
    @IBOutlet weak var labelout: UILabel!
    
    var labelText: String?
    weak var delegate: ChangeColourDelegate?
    
    override func loadView() {
        super.loadView()
        print(#function,"for secondview controller")
    }
    
    override func awakeFromNib() {
        print(#function,"for secondview controller")
    }
    
    override func viewDidLoad() {
        labelout.text = labelText
        super.viewDidLoad()
        print(#function,"for secondview controller")
        // Do any additional setup after loading the view.
//        self.preferredContentSize = CGSize(width: 300, height: 400)
    }

    override func viewWillAppear(_ animated: Bool) {
        //every time
        print(#function,"for secondview controller")
        let array = navigationController?.viewControllers
        print(array as [UIViewController]?)
        super.viewWillAppear(true)
    }
    
    func viewIsAppearing(){
       print(#function,"for secondview controller")
   }
    
    override func viewDidAppear(_ animated: Bool) {
       
        print(#function,"for secondview controller")
        super.viewDidAppear(animated)
    }
   

    override func viewWillLayoutSubviews(){
//        view.layer.cornerRadius = view.frame.height 12
        view.frame = CGRect(x: 10, y: 200, width: 400, height: 300)
        print(#function,"for secondview controller")
    }
    override func viewDidLayoutSubviews(){
//        view.layer.cornerRadius = view.frame.height
        print(#function,"for secondview controller")
    }

    override func viewWillDisappear(_ animated: Bool) {
//        every time
        print(#function,"for secondview controller")
        super.viewWillDisappear(animated)
    }
   
    override func viewDidDisappear(_ animated: Bool) {
        print(#function,"for secondview controller")
        super.viewDidDisappear(animated)
    }
    
    func presentationController(
            forPresented presented: UIViewController,
            presenting: UIViewController?,
            source: UIViewController
        ) -> UIPresentationController? {
            print("func called",#function)
            return CustomPresentationController(
                presentedViewController: presented,
                presenting: presenting
            )
        }
    
    @IBAction func btnSecond(_ sender: Any) {
        let thirdVC = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        thirdVC.str = labelText
        
        thirdVC.delegate = delegate
        thirdVC.modalPresentationStyle = .formSheet
        thirdVC.transitioningDelegate = self
        
//        if let sheet = thirdVC.sheetPresentationController {
//            sheet.detents = [
//                .custom { context in
//                    return 500
//                    }
//            ]
//            
//        }
//        self.present(thirdVC, animated: true)
        self.navigationController?.pushViewController(thirdVC, animated: true)
//        self.navigationController?.popViewController(animated: true)
        
//        self.dismiss(animated: true, completion: nil)
        
        print("==========================")
        print("second view presented")
    }
    
    
    @IBAction func BtnOnClickChnageFirstVcColour(_ sender: Any) {
        let click = "clicked from second"
        delegate?.didTapChangeColor(color: UIColor.orange,click: click)
        
    }
    
    
    @IBAction func btnDismissSecondVC(_ sender: Any) {
        self.dismiss(animated: true)
        print("second view dismised")
    }
    

}
