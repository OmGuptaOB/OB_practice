//
//  CVMiniCell.swift
//  Cycle_Shop_practice
//
//  Created by OBMac-13 on 25/02/26.
//

import UIKit

class CVMiniCell: UICollectionViewCell {
    
    @IBOutlet weak var imgViewMini: UIImageView!
    
    private let gradient = CAGradientLayer()
    
    private let borderGradient = CAGradientLayer()
    private let borderMask = CAShapeLayer()
       

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let cornerRadius: CGFloat = 5
        
        let heightofcell = contentView.frame.height
//        gradient.frame = contentView.bounds
//        borderGradient.frame = contentView.bounds
//            
        let path = UIBezierPath(
            roundedRect: contentView.bounds,
            cornerRadius: cornerRadius
        )
//        gradient.cornerRadius = contentView.frame.height / 4
//        borderMask.path = path.cgPath
//        borderMask.fillColor = UIColor.clear.cgColor
//        borderMask.strokeColor = UIColor.black.cgColor
//        borderMask.lineWidth = 2
    }
       
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
           if let card = contentView as? GlassCardView {
               card.cornerRadius = 18
           }
//        setupGradient()
//        setupShadow()
//        setupBlur()
//        
//        setupGradientBorder()
    }
    
    private func setupGradient() {
        
        contentView.backgroundColor = .clear
        backgroundColor = .clear
//        let heightofcell = contentView.frame.height
        gradient.colors = [
            UIColor(hex: "#353F54")!.withAlphaComponent(0.5).cgColor,
            UIColor(hex: "#222834")!.withAlphaComponent(0.5).cgColor
        ]
        
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
//        gradient.cornerRadius = heightofcell/4
        
        contentView.layer.insertSublayer(gradient, at: 0)
    }
    
    private func setupBlur() {
        let cornerRadius: CGFloat = 5
        let heightofcell = contentView.frame.height
        let blur = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let blurView = UIVisualEffectView(effect: blur)
        
        blurView.frame = contentView.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.layer.cornerRadius = cornerRadius
        blurView.clipsToBounds = true
        
        contentView.insertSubview(blurView, at: 0)
    }
    
    private func setupShadow() {
        let cornerRadius: CGFloat = 5
        let heightofcell = contentView.frame.height
        layer.shadowColor = UIColor(hex: "#10141C")!.cgColor
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSize(width: 0, height: 20)
        layer.shadowRadius = cornerRadius
        
        layer.masksToBounds = false
        
        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = true
    }
    
    private func setupGradientBorder() {
        
        borderGradient.colors = [
            UIColor.white.withAlphaComponent(0.6).cgColor,
            UIColor.black.withAlphaComponent(0.6).cgColor
        ]
        
        // 134.4° angle ≈ diagonal bottom-left to top-right
        borderGradient.startPoint = CGPoint(x: 0, y: 0)
        borderGradient.endPoint = CGPoint(x: 1, y: 1)
        
        contentView.layer.addSublayer(borderGradient)
        
        borderGradient.mask = borderMask
    }
    
    func configureGradient(isSelected: Bool) {
        guard let card = contentView as? GlassCardView else { return }
        isSelected ? card.setAccentStyle() : card.setDarkStyle()
    }
}
