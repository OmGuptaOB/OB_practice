//
//  ViewController.swift
//  AutoLayout_practice
//
//  Created by OBMac-13 on 30/01/26.
//

import UIKit

class ViewController: UIViewController {

    
    
//    @IBOutlet weak var OutputView: UIView!
//    @IBOutlet weak var firstView: UIView!
//    @IBOutlet weak var secondView: UIView!
//    @IBOutlet weak var thirdView: UIView!
//    @IBOutlet weak var fourthView: UIView!
//    @IBOutlet weak var fifthView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //% btn
//        let btnModulo = createAndAssignButton(whichview: firstView, title: "%", bgcolor: .black)
//        setBtnHeightWidth(btn: btnModulo,whichView: firstView, previousbtn: UIButton)
//        //+/- btn
//        let btnPlsMinus = createAndAssignButton(whichview: firstView, title: "+/-", bgcolor: .black)
//        
//        setBtnHeightWidth(btn: btnPlsMinus,whichView: firstView,previousbtn: btnModulo)
//        btnPlsMinus.leadingAnchor.constraint(equalTo: btnModulo.trailingAnchor, constant: 2).isActive = true
    }
    func createAndAssignButton(whichview : UIView, title : String, bgcolor : UIColor) -> UIButton{
        let btn = UIButton(type: .system)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 45)
        btn.backgroundColor = bgcolor
        btn.translatesAutoresizingMaskIntoConstraints = false
        whichview.addSubview(btn)
        return btn
    }
    
    func setBtnHeightWidth(width: CGFloat = 100, btn: UIButton , whichView : UIView,previousbtn : UIButton){
        
        btn.heightAnchor.constraint(equalTo: whichView.safeAreaLayoutGuide.heightAnchor , constant:  -2).isActive = true
        btn.widthAnchor.constraint(equalToConstant: width).isActive = true
        previousbtn.leadingAnchor.constraint(equalTo: btn.trailingAnchor, constant: 2).isActive = true
//        btn.trailingAnchor.constraint(equalTo: whichView.safeAreaLayoutGuide.trailingAnchor,constant: -2).isActive = true
//        btn.bottomAnchor.constraint(equalTo: whichView.bottomAnchor,constant: 2)
        
    }


}

