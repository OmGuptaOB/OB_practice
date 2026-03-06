//
//  ViewController.swift
//  Navigation_Controller_Practice
//
//  Created by OBMac-13 on 02/02/26.
//

import UIKit

class ViewController: UIViewController,ChangeColourDelegate {
    
    
    @IBOutlet weak var LblwhichClick: UILabel!
    //    weak var delegate: ChangeColourDelegate?
    
    
  override func loadView() {
        super.loadView()
        print(#function,"for view controller")
    }
    
    
    override func awakeFromNib() {
        print(#function,"for view controller")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print(#function,"for view controller")
       
        // Do any additional setup after loading the view.
        
    }
  
   
    override func viewWillAppear(_ animated: Bool) {
        print(#function,"for view controller")
        let array = navigationController?.viewControllers
        print(array as [UIViewController]?)
        super.viewWillAppear(true)
    }
    
    func viewIsAppearing(){
       print(#function,"for view controller")
   }
    
    override func viewDidAppear(_ animated: Bool) {
        print(#function,"for view controller")
        super.viewDidAppear(animated)
    }
   
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(view.frame)
        print("will layout")
    }

    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        print(view.frame)
        print(#function,"for view controller")
    }

    override func viewWillDisappear(_ animated: Bool) {
        print(#function,"for view controller")
        super.viewWillDisappear(animated)
    }
   
    override func viewDidDisappear(_ animated: Bool) {
        print(#function,"for view controller")
        super.viewDidDisappear(animated)
    }
    
//    func presentationController(
//            forPresented presented: UIViewController,
//            presenting: UIViewController?,
//            source: UIViewController
//        ) -> UIPresentationController? {
//            print(#function)
//            return CustomPresentationController(
//                presentedViewController: presented,
//                presenting: presenting
//            )
//        }
    
    @IBAction func btnfirst(_ sender: Any) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondVC.delegate = self
        secondVC.labelText = "Hello, World!"
        let navController = UINavigationController(rootViewController: secondVC)
        
        if let sheet = navController.sheetPresentationController {
            sheet.detents = [
                .custom { context in
                    return 500
                }
            ]
            
        }
        secondVC.modalPresentationStyle = .pageSheet
//        secondVC.transitioningDelegate = self
        
        self.present(navController, animated: true) // this also works
        print("==========================")
        print("first view crossed")
    }
    
 
   
    func didTapChangeColor(color: UIColor,click : String) {
        view.backgroundColor = color
        LblwhichClick.text = click
    }
    
    
    @IBAction func btnOnClickToFourthVC(_ sender: Any) {
        let FourthVC = storyboard?.instantiateViewController(
                withIdentifier: "FourthViewController"
        ) as! FourthViewController
      
        self.navigationController?.pushViewController(FourthVC, animated: true)
        
    }
    
        
        
    }
    

