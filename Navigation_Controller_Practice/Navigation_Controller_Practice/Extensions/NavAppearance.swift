//
//  NavAppearance.swift
//  Navigation_Controller_Practice
//
//  Created by OBMac-13 on 09/02/26.
//

import UIKit

extension UINavigationController{
    
    func setupNavigationBar(){
     
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        
        appearance.backgroundColor = view.backgroundColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        
        self.navigationBar.tintColor = .white
        UIBarButtonItem.appearance().tintColor = .white
    }
    
   
}

