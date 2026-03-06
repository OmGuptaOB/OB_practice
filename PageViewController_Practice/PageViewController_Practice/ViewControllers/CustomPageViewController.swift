//
//  CustomPageViewController.swift
//  PageViewController_Practice
//
//  Created by OBMac-13 on 18/02/26.
//

import UIKit

class CustomPageViewController: UIPageViewController{
    
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    let initialPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setup()
    }
    
//    func setup() {
//        delegate = self
//        dataSource = self
//        
//    }
    
}

//extension CustomPageViewController : UIPageViewControllerDelegate, UIPageViewControllerDataSource {
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
//    }
//    
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        <#code#>
//    }
//}
