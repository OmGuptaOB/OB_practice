//
//  ViewController.swift
//  GestureRecognizer_Practice
//
//  Created by OBMac-13 on 06/03/26.
//

import UIKit

class ViewController: UIViewController {

    private var isSideViewOpen = false
    
    @IBOutlet weak var swipeGestureView: UIView!
    
//    @IBOutlet weak var pinchGestureview: UIView!
    
    @IBOutlet weak var addViewBtn: UIButton!
    
    
    @IBOutlet var tapgestureRecogniser: UITapGestureRecognizer!
    
    @IBOutlet var swipeGestureRecognizer: UISwipeGestureRecognizer!
    
    @IBOutlet var pinchGestureRecognizer: UIPinchGestureRecognizer!
    
    @IBOutlet var rotationGestureRecogniser: UIRotationGestureRecognizer!
    
    
    @IBOutlet var panGestureRecogniser: UIPanGestureRecognizer!
    
    @IBOutlet weak var sideView: UIView!
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet weak var btn3: UIButton!
    
    @IBOutlet weak var btn4: UIButton!
    
    
    @IBOutlet weak var sideviewLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var sideviewTrailingConstraint: NSLayoutConstraint!
    
    
    var randomColour: UIColor {
        return UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        setupInitialGestures()
        swipeGestureView.isHidden = true
        
        
        // Hide sideView off-screen to the left initially
        sideviewLeadingConstraint.constant = -view.frame.width
        sideviewTrailingConstraint.constant = view.frame.width
        view.layoutIfNeeded()
        
        
        //panedge
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleEdgeSwipe))
        edgePan.edges = .left
        view.addGestureRecognizer(edgePan)
        
        edgePan.delegate = self

        
        // Tap outside (on main view) to close
           let tapOutside = UITapGestureRecognizer(target: self, action: #selector(handleTapOutside(_:)))
           tapOutside.cancelsTouchesInView = false
           view.addGestureRecognizer(tapOutside)
        
        
    }

    // Add these two methods
    private func assignRandomColoursToButtons() {
        [btn1, btn2, btn3, btn4].forEach { button in
            let colour = randomColour
            button?.backgroundColor = colour
            // Store colour in button's tag workaround — use layer instead
            button?.layer.setValue(colour, forKey: "assignedColour")
        }
    }

    private func openSideMenu() {
        guard !isSideViewOpen else { return }
        isSideViewOpen = true

        sideviewLeadingConstraint.constant = 10
        sideviewTrailingConstraint.constant = 300

        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        assignRandomColoursToButtons()
    }

    @objc func closeSideMenu() {
        guard isSideViewOpen else { return }
        isSideViewOpen = false

        sideviewLeadingConstraint.constant = -view.frame.width
        sideviewTrailingConstraint.constant = view.frame.width

        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

    @objc func handleTapOutside(_ gesture: UITapGestureRecognizer) {
        guard isSideViewOpen else { return }
        let location = gesture.location(in: view)
        // Only close if tap is outside the sideView
        if !sideView.frame.contains(location) {
            closeSideMenu()
        }
    }

    private func setupInitialGestures() {
        setupGestures(for: swipeGestureView)
    }
    

    private func setupGestures(for view: UIView) {
        // Tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(gestureFired(_:)))
        tap.numberOfTapsRequired = 2
        tap.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tap)
        
        // Swipe
        //swipe
//               let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
//               swipeUp.direction = .up
        
//        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
//             swipeDown.direction = .down
        
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
//                swipeRight.direction = .right
//        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
//        swipeleft.direction = .left
        
//        swipeGestureView.addGestureRecognizer(swipeUp)
//               swipeGestureView.addGestureRecognizer(swipeDown)
//               swipeGestureView.addGestureRecognizer(swipeRight)
//               swipeGestureView.addGestureRecognizer(swipeleft)
        let directions: [UISwipeGestureRecognizer.Direction] = [.up, .down, .right, .left]
        for direction in directions {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
            swipe.direction = direction
            view.addGestureRecognizer(swipe)
        }
        
        // Pinch
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchGestureFired(_:)))
        view.addGestureRecognizer(pinch)
        
        pinch.delegate = self
        
        // Rotate
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotationGestureFired(_:)))
        view.addGestureRecognizer(rotate)
        
        rotate.delegate = self
        
        // Pan
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panGestureFired(_:)))
        view.addGestureRecognizer(pan)
        
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        view.addGestureRecognizer(longPress)

    }

    @IBAction func addDynamicViewTapped(_ sender: UIButton) {
        let newView = UIView()

        newView.backgroundColor = randomColour
        newView.frame = CGRect(
            x: CGFloat.random(in: 20...200),
            y: CGFloat.random(in: 100...500),
            width: 300,
            height: 200
        )
        
        setupGestures(for: newView)
        
        view.addSubview(newView)
        
        print("New view added")
    }
    
    


    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        
        switch gesture.direction {
        case .up:
            print("Swiped Up")
            
        case .down:
            print("Swiped Down")
            
        case .right:
            print("Swiped Right")
            
        case .left:
            print("Swiped Left")
            
        default:
            break
        }
    }
    
    @objc func handleEdgeSwipe(_ gesture: UIScreenEdgePanGestureRecognizer) {
        if gesture.state == .recognized {
            openSideMenu()
        }
    }
    
    @objc func gestureFired(_ sender: UITapGestureRecognizer) {

        guard let tappedView = sender.view else { return }

        UIView.animate(withDuration: 0.3) {
            tappedView.transform = .identity
        }

    }
    
    func swipeGestureFired(_ sender: Any) {
        print("swiped",swipeGestureRecognizer.direction.rawValue)
    }
    
    @objc func pinchGestureFired(_ sender: UIPinchGestureRecognizer) {
        guard let view = sender.view else { return }
        
        switch sender.state {
        case .began, .changed:
            view.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        case .ended, .cancelled:
            UIView.animate(withDuration: 0.3) {
                view.transform = .identity
            }
        default:
            break
        }
    }
    
    @objc func rotationGestureFired(_ sender: UIRotationGestureRecognizer) {
        guard let view = sender.view else { return }
        view.transform = view.transform.rotated(by: sender.rotation)
        sender.rotation = 0
    }

    
//    @objc func panGestureFired(_ sender: UIPanGestureRecognizer) {
//        guard let viewToMove = sender.view else { return }
//        let translation = sender.translation(in: view)
//
//        viewToMove.center = CGPoint(
//            x: viewToMove.center.x + translation.x,
//            y: viewToMove.center.y + translation.y
//        )
//
//        sender.setTranslation(.zero, in: view)
//    }
    @objc func panGestureFired(_ sender: UIPanGestureRecognizer) {

        guard let viewToMove = sender.view else { return }

        let translation = sender.translation(in: view)

        viewToMove.center = CGPoint(
            x: viewToMove.center.x + translation.x,
            y: viewToMove.center.y + translation.y
        )

        sender.setTranslation(.zero, in: view)

        if sender.state == .ended {

            let velocity = sender.velocity(in: view)

            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: velocity.x / 100,
                           options: []) {

                viewToMove.center.x += velocity.x * 0.2
                viewToMove.center.y += velocity.y * 0.2

            }
        }
        
        if sender.state == .ended{
            if swipeGestureView.frame.intersects(addViewBtn.frame){
                UIView.animate(withDuration: 0.3) {
                    self.view.alpha = 0.0
                }
            }
        }
    }
    @IBAction func sideMenuButtonTapped(_ sender: UIButton) {
        if let colour = sender.layer.value(forKey: "assignedColour") as? UIColor {
            UIView.animate(withDuration: 0.3) {
                self.view.backgroundColor = colour
            }
//            closeSideMenu()
        }
    }
    
    @objc func handleLongPress(_ gesture: UILongPressGestureRecognizer) {

        if gesture.state == .began {
//            view.transform = CGAffineTransform(scaleX:2, y:5)
            view.alpha = 0.5
            gesture.view?.removeFromSuperview()

            print("View deleted")
        }

    }

    
}
extension ViewController : UIGestureRecognizerDelegate{
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {

        if isSideViewOpen && gestureRecognizer is UIPanGestureRecognizer {
            return false
        }

        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldReceive touch: UITouch) -> Bool {

        if touch.view is UIButton {
            return false
        }

        return true
    }
//    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
//                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        
//        if gestureRecognizer is UIRotationGestureRecognizer && otherGestureRecognizer is UIPinchGestureRecognizer {
//            return true
//        }
//        return false
//    }
//    
    
}

