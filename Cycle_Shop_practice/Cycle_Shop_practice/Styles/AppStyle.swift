//
//  AppStyle.swift
//  Cycle_Shop_practice
//
//  Created by OBMac-13 on 26/02/26.
//

//  Single source of truth for all colors, gradients, and shadow configs.
//  If you ever rebrand, change values HERE only.
//

import UIKit

enum AppStyle {

    // =========================================================
    // MARK: — Colors
    // =========================================================

    enum Colors {

        // Card backgrounds
        static let cardTop    = UIColor(hex: "#353F54")!
        static let cardBottom = UIColor(hex: "#222834")!

        // Brand blue (used on text, buttons, active states)
        static let brandBlueStart = UIColor(hex: "#3CA4EB")!
        static let brandBlueEnd   = UIColor(hex: "#4286EE")!

        // Selected button background
        static let buttonSelected   = UIColor(hex: "#323B4F")!
        // Unselected button background
        static let buttonUnselected = UIColor(hex: "#28303F")!

        // Shadow
        static let shadowColor = UIColor(hex: "#10141C")!

        // Border
        static let borderTop    = UIColor.white.withAlphaComponent(0.6)
        static let borderBottom = UIColor.black.withAlphaComponent(0.6)

        // Special — blue gradient card (e.g. first filter chip)
        static let accentGradientStart = UIColor(hex: "#4E4AF2")!
        static let accentGradientEnd   = UIColor(hex: "#34C8E8")!
    }

    // =========================================================
    // MARK: — Gradient Configs
    // =========================================================

    enum Gradients {

        /// Standard dark card background gradient
        static func cardBackground(alpha: CGFloat = 1.0) -> GradientConfig {
            GradientConfig(
                colors: [
                    Colors.cardTop.withAlphaComponent(alpha).cgColor,
                    Colors.cardBottom.withAlphaComponent(alpha).cgColor
                ],
                start: CGPoint(x: 0, y: 0),
                end:   CGPoint(x: 1, y: 1)
            )
        }
        
        
        /// Standard grey  background gradient
        static func basicBackground(alpha: CGFloat = 1.0) -> GradientConfig {
            GradientConfig(
                colors: [
                    Colors.buttonSelected.withAlphaComponent(alpha).cgColor,
                    Colors.buttonUnselected.withAlphaComponent(alpha).cgColor
                ],
                start: CGPoint(x: 0, y: 0),
                end:   CGPoint(x: 1, y: 1)
            )
        }

        /// Brand blue gradient (buttons, active text)
        static func brandBlue() -> GradientConfig {
            GradientConfig(
                colors: [
                    Colors.brandBlueStart.cgColor,
                    Colors.brandBlueEnd.cgColor
                ],
                start: CGPoint(x: 0, y: 0),
                end:   CGPoint(x: 1, y: 1)
            )
        }

        /// Glass border gradient (white top → black bottom)
        static func glassBorder() -> GradientConfig {
            GradientConfig(
                colors: [
                    Colors.borderTop.cgColor,
                    Colors.borderBottom.cgColor
                ],
                start: CGPoint(x: 0, y: 0),
                end:   CGPoint(x: 1, y: 1)
            )
        }

        /// Accent blue gradient (first filter chip, highlighted cards)
        static func accentBlue() -> GradientConfig {
            GradientConfig(
                colors: [
                    Colors.accentGradientStart.cgColor,
                    Colors.accentGradientEnd.cgColor
                ],
                start: CGPoint(x: 0, y: 0),
                end:   CGPoint(x: 1, y: 1)
            )
        }
    }

    // =========================================================
    // MARK: — Shadow Configs
    // =========================================================

    enum Shadows {

        /// Standard card drop shadow
        static let card = ShadowConfig(
            color:   Colors.shadowColor.cgColor,
            opacity: 0.6,
            offset:  CGSize(width: 0, height: 20),
            radius:  30
        )

        /// Lighter shadow used on description / price panels
        static let panel = ShadowConfig(
            color:   UIColor.black.cgColor,
            opacity: 0.25,
            offset:  CGSize(width: 0, height: -20),
            radius:  60
        )

        /// Neumorphic pressed shadow (used in DescButtons unselected)
        static let neumorphicOuter = ShadowConfig(
            color:   UIColor(hex: "#252B39")!.cgColor,
            opacity: 1.0,
            offset:  CGSize(width: 0, height: 0),
            radius:  5
        )
    }

    // =========================================================
    // MARK: — Corner Radii
    // =========================================================

    enum CornerRadius {
        static let card:   CGFloat = 20
        static let panel:  CGFloat = 15
        static let button: CGFloat = 10
        static let minibutton: CGFloat = 5
        
        static let pill:   CGFloat = 50
    }
}

// =========================================================
// MARK: — Supporting Value Types
// =========================================================

struct GradientConfig {
    let colors: [CGColor]
    let start:  CGPoint
    let end:    CGPoint

    /// Applies this config to an existing CAGradientLayer
    func apply(to layer: CAGradientLayer) {
        layer.colors     = colors
        layer.startPoint = start
        layer.endPoint   = end
    }

    /// Creates and returns a new CAGradientLayer with this config applied
    func makeLayer() -> CAGradientLayer {
        let layer = CAGradientLayer()
        apply(to: layer)
        return layer
    }
}

struct ShadowConfig {
    let color:   CGColor
    let opacity: Float
    let offset:  CGSize
    let radius:  CGFloat

    /// Applies this shadow config to any CALayer
    func apply(to layer: CALayer) {
        layer.shadowColor   = color
        layer.shadowOpacity = opacity
        layer.shadowOffset  = offset
        layer.shadowRadius  = radius
        layer.masksToBounds = false
    }
}
