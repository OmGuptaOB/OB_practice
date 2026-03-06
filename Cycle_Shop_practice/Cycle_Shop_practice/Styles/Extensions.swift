//
//  Extensions.swift
//  Cycle_Shop_practice
//
//  Created by OBMac-13 on 26/02/26.
//


//  Reusable gradient text — replaces the repeated CATextLayer
//  mask logic in DescriptionViewController and DescButtons.
//
//  USAGE:
//      lblPrice.applyBrandGradient()
//      titleLabel.applyBrandGradient()
//      lblPrice.removeGradient()   // resets to plain white text
//

import UIKit

extension UILabel {

    // Key for objc_setAssociatedObject so we can retrieve & remove the layer later
    private static var gradientKey = "labelGradientLayer"

    /// Applies the app's brand blue gradient (#3CA4EB → #4286EE) to the label text.
    /// Call this instead of setting textColor when you want gradient text.
    func applyBrandGradient() {
        applyGradient(config: AppStyle.Gradients.brandBlue())
    }

    /// Applies any GradientConfig as a text gradient.
    func applyGradient(config: GradientConfig) {

        // Make the real textColor invisible — gradient layer provides the color
        textColor = .clear

        // Remove any previous gradient layer cleanly
        removeGradient()

        // Build gradient layer
        let gradientLayer        = config.makeLayer()
        gradientLayer.frame      = bounds

        // Build text mask so gradient only shows through the glyphs
        let textMask             = CATextLayer()
        textMask.string          = text
        textMask.font            = font
        textMask.fontSize        = font.pointSize
        textMask.alignmentMode   = .center
        textMask.contentsScale   = UIScreen.main.scale
        textMask.frame           = bounds

        gradientLayer.mask       = textMask
        layer.addSublayer(gradientLayer)

        // Store reference so we can remove it later
        objc_setAssociatedObject(
            self,
            &UILabel.gradientKey,
            gradientLayer,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
    }

    /// Removes the gradient layer and restores plain white text.
    func removeGradient() {
        if let existing = objc_getAssociatedObject(self, &UILabel.gradientKey) as? CAGradientLayer {
            existing.removeFromSuperlayer()
        }
        objc_setAssociatedObject(self, &UILabel.gradientKey, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    /// Call from layoutSubviews / viewDidLayoutSubviews to keep the gradient frame in sync.
    func updateGradientFrame() {
        if let existing = objc_getAssociatedObject(self, &UILabel.gradientKey) as? CAGradientLayer {
            existing.frame      = bounds
            existing.mask?.frame = bounds
        }
    }
}


//
//  UIButton+Gradient.swift
//  Cycle_Shop_practice
//
//  Adds a gradient background to any UIButton without subclassing.
//
//  USAGE:
//      lblAddToCartButton.applyBrandGradient(cornerRadius: 15)
//      myButton.applyGradient(config: AppStyle.Gradients.accentBlue(), cornerRadius: 10)
//

extension UIButton {

    private static var gradientKey = "buttonGradientLayer"

    /// Applies the brand blue gradient as the button's background.
    func applyBrandGradient(cornerRadius: CGFloat = AppStyle.CornerRadius.button) {
        applyGradient(config: AppStyle.Gradients.brandBlue(), cornerRadius: cornerRadius)
    }
    
    /// Applies the brand blue gradient as the button's background.
    func applyDarkGradient(cornerRadius: CGFloat = AppStyle.CornerRadius.button) {
        applyGradient(config: AppStyle.Gradients.cardBackground(), cornerRadius: cornerRadius)
    }


    /// Applies any GradientConfig as the button's background layer.
    func applyGradient(config: GradientConfig, cornerRadius: CGFloat = AppStyle.CornerRadius.button) {

        removeGradient()

        let gradientLayer              = config.makeLayer()
        gradientLayer.frame            = bounds
        gradientLayer.cornerRadius     = cornerRadius
        gradientLayer.name             = "gradientLayer" // Useful for debugging

        // Ensure it's behind everything
        layer.insertSublayer(gradientLayer, at: 0)
        
        // Button subviews (titleLabel, imageView) can sometimes be moved below 
        // the layer we just inserted if not careful.
        if let imageView = self.imageView { bringSubviewToFront(imageView) }
        if let titleLabel = self.titleLabel { bringSubviewToFront(titleLabel) }

        objc_setAssociatedObject(
            self,
            &UIButton.gradientKey,
            gradientLayer,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
    }

    func removeGradient() {
        if let existing = objc_getAssociatedObject(self, &UIButton.gradientKey) as? CAGradientLayer {
            existing.removeFromSuperlayer()
        }
        objc_setAssociatedObject(self, &UIButton.gradientKey, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    /// Call from layoutSubviews to keep the gradient frame correct.
    func updateGradientFrame() {
        if let existing = objc_getAssociatedObject(self, &UIButton.gradientKey) as? CAGradientLayer {
            existing.frame = bounds
            
            // Re-ensure subviews stay on top
            if let imageView = self.imageView { bringSubviewToFront(imageView) }
            if let titleLabel = self.titleLabel { bringSubviewToFront(titleLabel) }
        }
    }
}


//
//  CALayer+Shadow.swift
//  Cycle_Shop_practice
//
//  Convenience extension so any CALayer can apply a ShadowConfig in one line.
//
//  USAGE:
//      layer.apply(shadow: AppStyle.Shadows.card)
//      contentView.layer.apply(shadow: AppStyle.Shadows.panel)
//

extension CALayer {

    /// Applies a ShadowConfig in a single call.
    func apply(shadow: ShadowConfig) {
        shadow.apply(to: self)
    }
}

extension UITextField {
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.size.height))
        leftView = paddingView
        leftViewMode = .always
    }
}
