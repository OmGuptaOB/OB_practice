    //
    //  DescButtons.swift
    //  Cycle_Shop_practice
    //
    //  Created by OBMac-13 on 25/02/26.
    //

    import UIKit

class DescButtons: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    //        private let gradientLayer = CAGradientLayer()
    private let textGradientLayer = CAGradientLayer()
    
    var isSelectedState: Bool = false {
        didSet {
            updateUI()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.updateGradientFrame()   // keeps gradient in sync
        // Force label to stay centered
          titleLabel.textAlignment = .center
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
        let nib = UINib(nibName: "DescButtons", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
        //        self.contentView = view
        setupInitialUI()
    }
    private func setupInitialUI() {
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    @objc private func buttonTapped() {
        isSelectedState.toggle()
    }
    private func updateUI() {
        
        if isSelectedState {
            contentView.backgroundColor = AppStyle.Colors.buttonSelected
            titleLabel.applyBrandGradient()                    // one line replaces ~20 lines
            AppStyle.Shadows.neumorphicOuter.apply(to: contentView.layer)
            contentView.layer.masksToBounds = false
        } else {
            contentView.backgroundColor = AppStyle.Colors.buttonUnselected
            titleLabel.removeGradient()
            titleLabel.textColor = UIColor.white.withAlphaComponent(0.6)
            contentView.layer.shadowOpacity = 0
            addInnerShadow()
        }
    }
    private func addInnerShadow() {
        
        contentView.layer.sublayers?.removeAll(where: { $0.name == "innerShadow" })
        
        let shadowLayer = CALayer()
        shadowLayer.name = "innerShadow"
        shadowLayer.frame = contentView.bounds
        shadowLayer.cornerRadius = 10
        
        shadowLayer.shadowColor = UIColor(hex: "#202633")!.cgColor
        shadowLayer.shadowOffset = CGSize(width: 3, height: 3)
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowRadius = 8
        
        shadowLayer.backgroundColor = contentView.backgroundColor?.cgColor
        
        let path = UIBezierPath(
            roundedRect: contentView.bounds.insetBy(dx: -10, dy: -10),
            cornerRadius: 10
        )
        
        let innerPath = UIBezierPath(
            roundedRect: contentView.bounds,
            cornerRadius: 10
        ).reversing()
        
        path.append(innerPath)
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        shadowLayer.mask = maskLayer
        
        contentView.layer.addSublayer(shadowLayer)
    }
    
    private func applyGradientToText(colors: [CGColor]) {
        
        textGradientLayer.removeFromSuperlayer()
        
        textGradientLayer.colors = colors
        textGradientLayer.startPoint = CGPoint(x: 0, y: 0)
        textGradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        textGradientLayer.frame = titleLabel.bounds
        
        let textMask = CATextLayer()
        textMask.string = titleLabel.text
        textMask.font = titleLabel.font
        textMask.fontSize = titleLabel.font.pointSize
        textMask.alignmentMode = .center
        textMask.contentsScale = UIScreen.main.scale
        textMask.frame = titleLabel.bounds
        
        textGradientLayer.mask = textMask
        
        titleLabel.layer.addSublayer(textGradientLayer)
    }
}
