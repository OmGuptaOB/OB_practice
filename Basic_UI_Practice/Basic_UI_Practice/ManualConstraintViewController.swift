//
//  ManualConstraintViewController.swift
//  Basic_UI_Practice
//
//  Created by OBMac-13 on 27/01/26.
//

import UIKit

class ManualConstraintViewController: UIViewController {
    
    
//    let myView : UIView = {
//        let myView = UIView()
//        myView.translatesAutoresizingMaskIntoConstraints = false
//        myView.backgroundColor = .systemBlue
//
//        return myView
//    }()

   
    
    let myView = UIView()
   
     func createViewWithCornerRadius( bgcolor backgroundColor : UIColor , bradius
                                      cornerRadius : CGFloat) -> UIView {
        let viewWithCornerRadius = UIView()
         myView.addSubview(viewWithCornerRadius)
        viewWithCornerRadius.backgroundColor = backgroundColor
        viewWithCornerRadius.layer.cornerRadius = cornerRadius
        return viewWithCornerRadius
    }
    
    func setHeightWidthAnchor(subView : UIView, height : CGFloat , width : CGFloat){
        subView.translatesAutoresizingMaskIntoConstraints = false
        subView.widthAnchor.constraint(equalToConstant: width).isActive = true
        subView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    
    
    override func loadView() {
        print(#function)
    }
    override func loadViewIfNeeded() {
        print(#function)
    }
//    override class func load() {
//        print(#function)
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myView)
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        myView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        myView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        myView.layer.backgroundColor = UIColor.systemBlue.cgColor
        
        let myView1 = createViewWithCornerRadius(bgcolor: .systemRed, bradius: 50)
        let myView2 = createViewWithCornerRadius(bgcolor: .systemYellow, bradius: 25)
        let myView3 = createViewWithCornerRadius(bgcolor: .systemYellow, bradius: 25)
        let myView4 = createViewWithCornerRadius(bgcolor: .systemYellow, bradius: 25)
        let myView5 = createViewWithCornerRadius(bgcolor: .systemYellow, bradius: 25)
       
        
//        view.addSubview(myView)
        setHeightWidthAnchor(subView: myView1, height: 100, width: 100)
        myView1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myView1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view.layer.backgroundColor = UIColor.darkGray.cgColor
        setHeightWidthAnchor(subView: myView2, height: 50, width: 50)
        myView2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        myView2.trailingAnchor.constraint(equalTo: myView1.leadingAnchor, constant: -10).isActive = true
        setHeightWidthAnchor(subView: myView3, height: 50, width: 50)
        myView3.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        myView3.leadingAnchor.constraint(equalTo: myView1.trailingAnchor,constant: 10).isActive = true
        setHeightWidthAnchor(subView: myView4, height: 50, width: 50)
        myView4.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myView4.bottomAnchor.constraint(equalTo: myView1.topAnchor,constant: -10).isActive = true
        setHeightWidthAnchor(subView: myView5, height: 50, width: 50)
        myView5.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myView5.topAnchor.constraint(equalTo: myView1.bottomAnchor,constant: 10).isActive = true
        
        //mini view
        let redminiView1 = createViewWithCornerRadius(bgcolor: .green, bradius: 20)
        setHeightWidthAnchor(subView: redminiView1, height: 25, width: 25)
        redminiView1.leadingAnchor.constraint(equalTo: myView1.trailingAnchor, constant: -10).isActive = true
        redminiView1.bottomAnchor.constraint(equalTo: myView1.topAnchor, constant: 10).isActive = true
        let greenminiView2 = createViewWithCornerRadius(bgcolor: .green, bradius: 20)
        setHeightWidthAnchor(subView: greenminiView2, height: 25, width: 25)
        greenminiView2.trailingAnchor.constraint(equalTo: myView1.leadingAnchor, constant: 10).isActive = true
        greenminiView2.bottomAnchor.constraint(equalTo: myView1.topAnchor, constant: 10).isActive = true
        let pinkminiView3 = createViewWithCornerRadius(bgcolor: .green, bradius: 20)
        setHeightWidthAnchor(subView: pinkminiView3, height: 25, width: 25)
        pinkminiView3.trailingAnchor.constraint(equalTo: myView1.leadingAnchor, constant: 10).isActive = true
        pinkminiView3.topAnchor.constraint(equalTo: myView1.bottomAnchor, constant: -10).isActive = true
        let yellowminiView4 = createViewWithCornerRadius(bgcolor: .green, bradius: 20)
        setHeightWidthAnchor(subView: yellowminiView4, height: 25, width: 25)
        yellowminiView4.leadingAnchor.constraint(equalTo: myView1.trailingAnchor, constant: -10).isActive = true
        yellowminiView4.topAnchor.constraint(equalTo: myView1.bottomAnchor, constant: -10).isActive = true
        
        
        //        myView6.topAnchor.constraint(equalTo: myView3.bottomAnchor,constant: 10).isActive = true
        
//        myView.addSubview(secondView)
//        addContstraints()
        
        
    }
    
    
//    func addContstraints(){
//        var constraints = [NSLayoutConstraint]()
//        //leading
//        constraints.append(myView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
//        //trailing
//        constraints.append(myView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
//        //top
//        constraints.append(myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
//        //bottom
//        constraints.append(myView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
//        
//        // second view inside myview
//        
//        //leading
////        constraints.append(secondView.leadingAnchor.constraint(equalTo: myView.safeAreaLayoutGuide.leadingAnchor, constant: 10))
////        //trailing
////        constraints.append(secondView.trailingAnchor.constraint(equalTo: myView.safeAreaLayoutGuide.trailingAnchor, constant: -10))
////        //top
////        constraints.append(secondView.topAnchor.constraint(equalTo: myView.safeAreaLayoutGuide.topAnchor, constant: 10))
////        //bottom
////        constraints.append(secondView.bottomAnchor.constraint(equalTo: myView.safeAreaLayoutGuide.bottomAnchor, constant: -10))
//        
//        
//        //width
////        constraints.append(secondView.widthAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 0.5))
////        //height
////        constraints.append(secondView.heightAnchor.constraint(equalTo: myView.heightAnchor, multiplier: 0.5))
////
////        
////        constraints.append(secondView.centerYAnchor.constraint(equalTo: myView.centerYAnchor))
////        constraints.append(secondView.centerXAnchor.constraint(equalTo: myView.centerXAnchor))
//        var activ = NSLayoutConstra      int.activate()
//    }
}
