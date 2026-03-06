//
//  ViewController.swift
//  TabBarController_practice
//
//  Created by OBMac-13 on 05/03/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tabbar: UITabBar!
    
    @IBOutlet weak var containerview: UIView!
    
    var currentVC: UIViewController?
    
    var homeVC: HomeVC!
      var searchVC: SearchVC!
      var profileVC: ProfileVC!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        searchVC = storyboard?.instantiateViewController(withIdentifier: "SearchVC") as? SearchVC
        profileVC = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC

        tabbar?.delegate = self
        
        tabbar.selectedItem = tabbar.items?[0]

        tabbar?.items?[0].title = "Home"
        tabbar?.items?[1].title = "Search"
        
        let profileItem = UITabBarItem(title: "profile", image: UIImage(systemName: "person.fill"), tag: 2)
//        tabbar?.items?[2].title = "Profile"
        var items = tabbar.items ?? []
        items.append(profileItem)
        tabbar.items = items

        switchVc(homeVC)
    }
    
 
    
    func switchVc(_ vc: UIViewController) {
        
        if let current = currentVC {
            current.view.removeFromSuperview()
            current.removeFromParent()
        }
        
        addChild(vc)
        vc.view.frame = containerview.bounds
        containerview.addSubview(vc.view)
        vc.didMove(toParent: self)
        
        currentVC = vc
    }

}

extension ViewController: UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        switch item.tag {
            
        case 0:
            switchVc(homeVC)
            
        case 1:
            switchVc(searchVC)
            
        case 2:
            switchVc(profileVC)
            
        default:
            break
        }
    }

}

