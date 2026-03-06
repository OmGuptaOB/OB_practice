//
//  CVCell.swift
//  Cycle_Shop_practice
//
//  Created by OBMac-13 on 24/02/26.
//

import UIKit

class CVCell: UICollectionViewCell {
    
    @IBOutlet weak var btnClickLike: UIButton!
    
    
    @IBOutlet weak var btnLikeImage: UIImageView!
    
    @IBOutlet weak var imgProduct: UIImageView!
    
    
    @IBOutlet weak var lblproduct: UILabel!
    
    
    @IBOutlet weak var lblProductId: UILabel!
    
    
    @IBOutlet weak var lblProductPrice: UILabel!
    
    private let gradient = CAGradientLayer()
    private let borderGradient = CAGradientLayer()
    private let borderMask = CAShapeLayer()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgProduct.image = nil
        setLiked(false)           // ← reset heart image view

        contentView.alpha = 1
        contentView.transform = .identity
    }
       
//    override func layoutSubviews() {
//        super.layoutSubviews()
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
//    }
       
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        setupLikeButton()
//        setupGradient()
//        setupShadow()
//        setupBlur()
//        setupGradientBorder()
    }
    

    
    func setupLikeButton() {
        // Start with the normal (unselected) heart
        setLiked(false)
        btnLikeImage.contentMode = .scaleAspectFit

        btnClickLike.addTarget(self, action: #selector(checkboxTapped), for: .touchUpInside)
    }

    /// Updates `btnLikeImage` to reflect the liked/unliked state.
    func setLiked(_ isLiked: Bool) {
        let imageName = isLiked ? "Heart_figma_selected" : "Heart_figma"
        btnLikeImage.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
    }

    var didTapLike: (() -> Void)?

    @objc func checkboxTapped(_ sender: UIButton) {
        didTapLike?()
    }

    private func setupGradient() {
        
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        gradient.colors = [
            UIColor(hex: "#353F54")!.withAlphaComponent(0.5).cgColor,
            UIColor(hex: "#222834")!.withAlphaComponent(0.5).cgColor
        ]
        
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        gradient.cornerRadius = 20
        
        contentView.layer.insertSublayer(gradient, at: 0)
    }
    
    private func setupBlur() {
        
        let blur = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let blurView = UIVisualEffectView(effect: blur)
        
        blurView.frame = contentView.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.layer.cornerRadius = 20
        blurView.clipsToBounds = true
        
        contentView.insertSubview(blurView, at: 0)
    }
    
    private func setupShadow() {
        
        layer.shadowColor = UIColor(hex: "#10141C")!.cgColor
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSize(width: 0, height: 20)
        layer.shadowRadius = 30
        
        layer.masksToBounds = false
        
        contentView.layer.cornerRadius = 20
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
        borderGradient.mask = borderMask }
    
}
