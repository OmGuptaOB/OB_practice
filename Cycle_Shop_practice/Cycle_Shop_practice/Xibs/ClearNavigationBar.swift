//
//  ClearNavigationBar.swift
//  Cycle_Shop_practice
//
//  Created by OBMac-13 on 26/02/26.
//

import UIKit

class ClearNavigationBar: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var lblTitleNav: UILabel!
    
    @IBOutlet weak var btnTitleNav: UIButton!
    
    @IBOutlet weak var btnTitleNav2: UIButton!
    
    override var semanticContentAttribute: UISemanticContentAttribute {
        get {
            return super.semanticContentAttribute
        }
        set {
            super.semanticContentAttribute = newValue
            contentView?.semanticContentAttribute = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ClearNavigationBar", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        
        // Ensure initial layout is clean
        layoutIfNeeded()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        // Ensure gradients are always in sync when the view (or its children) changes size
        btnTitleNav?.updateGradientFrame()
        btnTitleNav2?.updateGradientFrame()
    }
//    func setup() {
//        applyGradient(to: btnTitleNav, cornerRadius: 14)
//        contentView.backgroundColor = .clear
//        backgroundColor = .clear
//    }
//    func applyGradient(to button: UIButton, cornerRadius: CGFloat = 0) {
//            button.applyGradient(
//                config: AppStyle.Gradients.accentBlue(),
//                cornerRadius: cornerRadius
//            )
//        }

}
