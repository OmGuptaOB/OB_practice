//
//  CustomPresentationController.swift
//  Navigation_Controller_Practice
//
//  Created by OBMac-13 on 06/02/26.
//

import Foundation
import UIKit

class CustomPresentationController: UIPresentationController {
    
    override var frameOfPresentedViewInContainerView: CGRect {
        
        guard let container = containerView else {
            return .zero
        }
        
        let width: CGFloat = 400
        let height: CGFloat = 300
        
        let x = (container.bounds.width - width) / 2
        let y = (container.bounds.height - height) / 2
        
        return CGRect(x: x, y: y, width: width, height: height)
    }
}
