//
//  CheckOutViewController.swift
//  Cycle_Shop_practice
//
//  Created by OBMac-13 on 26/02/26.
//

import UIKit

class CheckOutViewController: UIViewController {
    
    @IBOutlet weak var producttableview: UITableView!
        
    @IBOutlet weak var discountTextfield: UITextField!
    
    @IBOutlet weak var applyDescountBtn: UIButton!
    
    @IBOutlet weak var lblSubTotal: UILabel!
    
    @IBOutlet weak var lblDeliveryFee: UILabel!
    
    @IBOutlet weak var lblTotalDiscount: UILabel!
    
    
    @IBOutlet weak var lblTotal: UILabel!
    
    @IBOutlet weak var btnCheckout: UIButton!
    
    @IBOutlet weak var discoverPageNavbar: ClearNavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        producttableview.delegate = self
        producttableview.dataSource = self
        producttableview.register(
                UINib(nibName: "ProductDetailCell", bundle: nil),
                forCellReuseIdentifier: "ProductDetailCell"
            )
        updateSummaryLabels()
        setupKeyboardObservers()
        setupGestureToDismissKeyboard()
        setupNavTitle()
        view.layoutIfNeeded()  // ← Force layout to resolve iPad bounds
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    private var hasSetupUI = false
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !hasSetupUI {
               setupUI()
               hasSetupUI = true
           }

        // Keep label and button gradients in sync with layout
        applyDescountBtn.updateGradientFrame()
        btnCheckout.updateGradientFrame()
        discoverPageNavbar.btnTitleNav.updateGradientFrame()
        
        // Keep shadow in sync with layout
        addInnerShadow()
    }
    
    func setupNavTitle() {
        discoverPageNavbar.lblTitleNav?.text = "My Shopping Cart"
        discoverPageNavbar.lblTitleNav.textAlignment = .left
        
        // 1. Change the image
        let backImage = UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysOriginal)
        discoverPageNavbar.btnTitleNav.setImage(backImage, for: .normal)
        
        // 2. Add the back action
        discoverPageNavbar.btnTitleNav.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
        discoverPageNavbar.btnTitleNav.applyBrandGradient(cornerRadius: AppStyle.CornerRadius.button)
        discoverPageNavbar.contentView.backgroundColor = .clear
        discoverPageNavbar.semanticContentAttribute = .forceRightToLeft
    }

    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }

    
    
    
    func setupUI(){
        discountTextfield.backgroundColor = AppStyle.Colors.buttonUnselected
        discountTextfield.setLeftPadding(15) // ← Add padding
        
        AppStyle.Shadows.neumorphicOuter.apply(to: discountTextfield.layer)
        discountTextfield.layer.masksToBounds = false
        discountTextfield.layer.shadowOpacity = 0
        
        // Ensure background doesn't hide the gradient
        btnCheckout.backgroundColor = .clear
        applyDescountBtn.backgroundColor = .clear
        
        // Gradient background on buttons
        applyDescountBtn.applyBrandGradient(cornerRadius: AppStyle.CornerRadius.minibutton)
        btnCheckout.applyBrandGradient(cornerRadius: AppStyle.CornerRadius.button)
        
        applyDescountBtn.addTarget(self, action: #selector(applyCouponTapped), for: .touchUpInside)
    }
    
    @objc func applyCouponTapped() {
        let code = discountTextfield.text ?? ""
        let success = CartManager.shared.applyCoupon(code: code)
        
        if success {
            updateSummaryLabels()
            // Optional: Show success alert
        } else {
            // Optional: Show error alert
        }
        view.endEditing(true)
    }
    
    private func setupGestureToDismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                // Move view up by half the keyboard height or enough to show the summary
                self.view.frame.origin.y -= (keyboardSize.height * 0.45)
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    private func addInnerShadow() {
        
        discountTextfield.layer.sublayers?.removeAll(where: { $0.name == "innerShadow" })
        
        let shadowLayer = CALayer()
        shadowLayer.name = "innerShadow"
        shadowLayer.frame = discountTextfield.bounds
        shadowLayer.cornerRadius = 10
        
        shadowLayer.shadowColor = UIColor(hex: "#202633")!.cgColor
        shadowLayer.shadowOffset = CGSize(width: 3, height: 3)
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowRadius = 8
        
        shadowLayer.backgroundColor = discountTextfield.backgroundColor?.cgColor
        
        let path = UIBezierPath(
            roundedRect: discountTextfield.bounds.insetBy(dx: -10, dy: -10),
            cornerRadius: 10
        )
        
        let innerPath = UIBezierPath(
            roundedRect: discountTextfield.bounds,
            cornerRadius: 10
        ).reversing()
        
        path.append(innerPath)
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        shadowLayer.mask = maskLayer
        
        discountTextfield.layer.addSublayer(shadowLayer)
    }
    
    func updateSummaryLabels() {
        lblSubTotal.text = "$\(String(format: "%.2f", CartManager.shared.subtotal))"
        lblDeliveryFee.text = "$\(String(format: "%.2f", CartManager.shared.deliveryFee))"
        lblTotalDiscount.text = " $\(String(format: "%.2f", CartManager.shared.totalDiscount))"
        lblTotal.text = "$\(String(format: "%.2f", CartManager.shared.total))"
    }
}

extension CheckOutViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if CartManager.shared.items.count == 0{
            navigationController?.popViewController(animated: true)
           return CartManager.shared.items.count
        }else{
            return CartManager.shared.items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailCell", for: indexPath) as! ProductDetailCell
        let cartItem = CartManager.shared.items[indexPath.row]
        
        cell.quantity = cartItem.quantity
        cell.lblproductTitle.text = cartItem.product.name
        cell.lblProductPrice.text = "$\(cartItem.product.price)"
        cell.totalProdDiscount.text = "\(cartItem.product.discountPercent)%"
        cell.productImageView.image = UIImage(named: cartItem.product.thumbnail)

        cell.quantityChanged = { [weak self] newQuantity in
            CartManager.shared.updateQuantity(at: indexPath.row, to: newQuantity)
            self?.updateSummaryLabels()
            // If quantity becomes 0, item is removed from manager, reload table
            if newQuantity == 0 {
                tableView.reloadData()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width = tableView.frame.width
        return width * 0.275
    }
}
