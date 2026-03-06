//
//  CVBannerCell.swift
//  Cycle_Shop_practice
//
//  Created by OBMac-13 on 24/02/26.
//

import UIKit
//bannerCell
class CVBannerCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imgBanner: UIImageView!
    
    @IBOutlet weak var lbldiscount: UILabel!
    
//    private let gradient = CAGradientLayer()
//    
//    private let borderGradient = CAGradientLayer()
//    private let borderMask = CAShapeLayer()
//       
    override func layoutSubviews() {
        super.layoutSubviews()
       
    }
//
//        gradient.frame = contentView.bounds
//        borderGradient.frame = contentView.bounds
//        
//        let path = UIBezierPath(
//            roundedRect: contentView.bounds,
//            cornerRadius: 20
//        )
//        
//        borderMask.path = path.cgPath
//        borderMask.fillColor = UIColor.clear.cgColor
//        borderMask.strokeColor = UIColor.black.cgColor
//        borderMask.lineWidth = 2
//        
//        lbldiscount.font = UIFont(name: "PoppinsMedium", size: 20)
//        
//    }
//       
    override func awakeFromNib() {
        super.awakeFromNib()
        //        setupGradient()
        //        setupShadow()
        //        setupBlur()
        //
        //        setupGradientBorder()
        // GlassCardView in Storyboard handles gradient, border, blur, shadow
        // Nothing else needed here
        setupUI()
    }
    
    func setupUI() {
        lbldiscount.font = UIFont.systemFont(ofSize: 35, weight: .bold)
    }
    
//    private func setupGradient() {
//        
//        contentView.backgroundColor = .clear
//        backgroundColor = .clear
//        
//        gradient.colors = [
//            UIColor(hex: "#353F54")!.withAlphaComponent(0.5).cgColor,
//            UIColor(hex: "#222834")!.withAlphaComponent(0.5).cgColor
//        ]
//        
//        gradient.startPoint = CGPoint(x: 0, y: 0)
//        gradient.endPoint = CGPoint(x: 1, y: 1)
//        
//        gradient.cornerRadius = 20
//        
//        contentView.layer.insertSublayer(gradient, at: 0)
//    }
    
//    private func setupBlur() {
//        
//        let blur = UIBlurEffect(style: .systemUltraThinMaterialDark)
//        let blurView = UIVisualEffectView(effect: blur)
//        
//        blurView.frame = contentView.bounds
//        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        blurView.layer.cornerRadius = 20
//        blurView.clipsToBounds = true
//        
//        contentView.insertSubview(blurView, at: 0)
//    }
    
//    private func setupShadow() {
//        
//        layer.shadowColor = UIColor(hex: "#10141C")!.cgColor
//        layer.shadowOpacity = 0.6
//        layer.shadowOffset = CGSize(width: 0, height: 20)
//        layer.shadowRadius = 30
//        
//        layer.masksToBounds = false
//        
//        contentView.layer.cornerRadius = 20
//        contentView.layer.masksToBounds = true
//    }
    
//    private func setupGradientBorder() {
//        
//        borderGradient.colors = [
//            UIColor.white.withAlphaComponent(0.6).cgColor,
//            UIColor.black.withAlphaComponent(0.6).cgColor
//        ]
//        
//        // 134.4° angle ≈ diagonal bottom-left to top-right
//        borderGradient.startPoint = CGPoint(x: 0, y: 0)
//        borderGradient.endPoint = CGPoint(x: 1, y: 1)
//        
//        contentView.layer.addSublayer(borderGradient)
//        
//        borderGradient.mask = borderMask
//    }
}
