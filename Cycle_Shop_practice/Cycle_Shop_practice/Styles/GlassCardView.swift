//
//  GlassCardView.swift
//  Cycle_Shop_practice
//
//  Created by OBMac-13 on 26/02/26.
//

//  Drop-in UIView subclass that renders the glass card style
//  used across the entire app (cells, panels, price view).
//
//  HOW TO USE IN STORYBOARD:
//  1. Add a UIView to your scene
//  2. In the Identity Inspector set Class → GlassCardView
//  3. Done. No extra code needed in the VC or cell.
//
//  CUSTOMISATION (all settable from code OR @IBInspectable in IB):
//  • cornerRadius   — default 20
//  • backgroundAlpha — 0.5 for frosted look, 1.0 for solid card
//  • showBlur       — toggle the UIBlurEffect layer
//  • shadowStyle    — .card (cells) or .panel (bottom sheets)
//  • gradientStyle  — .dark (default) or .accent (blue highlight)
//

import UIKit

// ── Enums ────────────────────────────────────────────────────────────────────

/// Controls which background gradient preset is used
@objc enum GlassGradientStyle: Int {
    case dark   = 0   // #353F54 → #222834  (standard card)
    case accent = 1   // #4E4AF2 → #34C8E8  (highlighted / first chip)
}

/// Controls which shadow preset is used
@objc enum GlassShadowStyle: Int {
    case card  = 0   // cells — offset Y+20, radius 30
    case panel = 1   // bottom panels — offset Y-20, radius 60
}

// ── Extensions ────────────────────────────────────────────────────────────────

extension CACornerMask {
    static func from(rectCorners: UIRectCorner) -> CACornerMask {
        var mask = CACornerMask()
        if rectCorners.contains(.topLeft) { mask.insert(.layerMinXMinYCorner) }
        if rectCorners.contains(.topRight) { mask.insert(.layerMaxXMinYCorner) }
        if rectCorners.contains(.bottomLeft) { mask.insert(.layerMinXMaxYCorner) }
        if rectCorners.contains(.bottomRight) { mask.insert(.layerMaxXMaxYCorner) }
        return mask
    }
}

// ── GlassCardView ─────────────────────────────────────────────────────────────

@IBDesignable
class GlassCardView: UIView {

    // ── Public properties (IB-inspectable) ───────────────────────────────────

    @IBInspectable var cornerRadius: CGFloat = AppStyle.CornerRadius.card {
        didSet { setNeedsLayout() }
    }

    /// 0.5 → frosted glass look   |   1.0 → solid card
    @IBInspectable var backgroundAlpha: CGFloat = 0.5 {
        didSet { applyBackgroundGradient() }
    }

    @IBInspectable var showBlur: Bool = true {
        didSet { showBlur ? insertBlurIfNeeded() : removeBlur() }
    }

    /// Use GlassGradientStyle raw values (0 = dark, 1 = accent)
    @IBInspectable var gradientStyleRaw: Int = 0 {
        didSet {
            gradientStyle = GlassGradientStyle(rawValue: gradientStyleRaw) ?? .dark
        }
    }

    /// Use GlassShadowStyle raw values (0 = card, 1 = panel)
    @IBInspectable var shadowStyleRaw: Int = 0 {
        didSet {
            shadowStyle = GlassShadowStyle(rawValue: shadowStyleRaw) ?? .card
        }
    }

    // ── Typed setters (use from code) ────────────────────────────────────────

    var gradientStyle: GlassGradientStyle = .dark {
        didSet { applyBackgroundGradient() }
    }

    var shadowStyle: GlassShadowStyle = .card {
        didSet { applyShadow() }
    }

    var roundedCorners: UIRectCorner = .allCorners {
        didSet { setNeedsLayout() }
    }

    // ── Private layer references ──────────────────────────────────────────────

    private let bgGradientLayer    = CAGradientLayer()
    private let borderGradientLayer = CAGradientLayer()
    private let borderMaskLayer    = CAShapeLayer()
    private weak var blurView: UIVisualEffectView?

    // ── Init ─────────────────────────────────────────────────────────────────

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonSetup()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }

    private func commonSetup() {
        backgroundColor = .clear

        setupBackgroundGradientLayer()
        setupBorderLayer()
        applyShadow()

        if showBlur { insertBlurIfNeeded() }
    }

    // ── Layout ────────────────────────────────────────────────────────────────

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let cornerMask = CACornerMask.from(rectCorners: roundedCorners)

        // Sync the view's primary layer to prevent background bleed-through
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = cornerMask

        // Background gradient fills the whole view
        bgGradientLayer.frame        = bounds
        bgGradientLayer.cornerRadius = cornerRadius
        bgGradientLayer.maskedCorners = cornerMask

        // Border gradient also fills the whole view; the mask strokes the edge
        borderGradientLayer.frame = bounds

        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: roundedCorners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        borderMaskLayer.path      = path.cgPath
        borderMaskLayer.lineWidth = 2

        // Keep blur layer in sync
        blurView?.frame              = bounds
        blurView?.layer.cornerRadius = cornerRadius
        blurView?.layer.maskedCorners = cornerMask

        // Shadow path for performance
        layer.shadowPath = path.cgPath
    }

    // ── Private setup helpers ─────────────────────────────────────────────────

    private func setupBackgroundGradientLayer() {
        applyBackgroundGradient()
        layer.insertSublayer(bgGradientLayer, at: 0)
    }

    private func applyBackgroundGradient() {
        let config: GradientConfig

        switch gradientStyle {
        case .dark:
            config = AppStyle.Gradients.cardBackground(alpha: backgroundAlpha)
        case .accent:
            config = AppStyle.Gradients.accentBlue()
        }

        config.apply(to: bgGradientLayer)
    }

    private func setupBorderLayer() {
        // Mask shape — strokes only the edge, no fill
        borderMaskLayer.fillColor   = UIColor.clear.cgColor
        borderMaskLayer.strokeColor = UIColor.black.cgColor   // color doesn't matter, mask uses alpha

        // Apply glass border gradient
        AppStyle.Gradients.glassBorder().apply(to: borderGradientLayer)
        borderGradientLayer.mask = borderMaskLayer

        layer.addSublayer(borderGradientLayer)
    }

    private func applyShadow() {
        let config = shadowStyle == .card
            ? AppStyle.Shadows.card
            : AppStyle.Shadows.panel

        config.apply(to: layer)
    }

    // ── Blur helpers ──────────────────────────────────────────────────────────

    private func insertBlurIfNeeded() {
        guard blurView == nil else { return }

        let blur = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let view = UIVisualEffectView(effect: blur)

        view.frame                = bounds
        view.autoresizingMask     = [.flexibleWidth, .flexibleHeight]
        view.layer.cornerRadius   = cornerRadius
        view.clipsToBounds        = true

        // Insert above the gradient but below all content subviews
        insertSubview(view, at: 0)
        blurView = view
    }

    private func removeBlur() {
        blurView?.removeFromSuperview()
    }

    // ── Public API ────────────────────────────────────────────────────────────

    /// Switches to accent (blue) gradient — e.g. first filter chip
    func setAccentStyle() {
        gradientStyle = .accent
    }

    /// Switches back to default dark card style
    func setDarkStyle() {
        gradientStyle = .dark
    }
}
