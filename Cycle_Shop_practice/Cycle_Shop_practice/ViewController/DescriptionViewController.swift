//
//  DescriptionViewController.swift
//  Cycle_Shop_practice
//
//  Created by OBMac-13 on 25/02/26.
//

import UIKit

class DescriptionViewController: UIViewController {
//    private let bgGradient = CAGradientLayer()
//    private let borderGradient = CAGradientLayer()
//    private let borderMask = CAShapeLayer()
    
    private let textGradientLayer = CAGradientLayer()
    private let btnGradientLayer = CAGradientLayer()
    
    
    @IBOutlet weak var prodTitleForDesc: UILabel!
    
    @IBOutlet weak var prodDescription: UITextView!


    @IBOutlet weak var descriptionView: UIView!
    
    @IBOutlet weak var topContainerView: UIView!
    
    @IBOutlet weak var priceView: UIView!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblAddToCartButton: UIButton!
    
    
    private var pageViewController: UIPageViewController!
    private var pages: [UIViewController] = []

    
    @IBOutlet weak var btnDescription: DescButtons!
    
    @IBOutlet weak var btnSpecification: DescButtons!
    
    @IBOutlet weak var discoverPageNavbar: ClearNavigationBar!
    
    
    @IBOutlet weak var descriptionViewBottomConstraint: NSLayoutConstraint!
    
    var isDescriptionVisible = true
    
    var product: Product?
    var bikeImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupPageView()
        view.layoutIfNeeded()
        setupDescButtons()
        setupPriceView()
        setupNavTitle()
        lblAddToCartButton.applyBrandGradient(cornerRadius: AppStyle.CornerRadius.button)
        navigationController?.setNavigationBarHidden(true, animated: false)
        // Add action to the Add to Cart button
        lblAddToCartButton.addTarget(self, action: #selector(addToCartTapped), for: .touchUpInside)
        
        
        // In viewDidLoad
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        topContainerView.addGestureRecognizer(tap)
        topContainerView.isUserInteractionEnabled = true
        
    }
    
    @objc func imageTapped() {
        toggleDescriptionView(show: false)
    }
    
    @objc func addToCartTapped() {
        guard let product = product else { return }
        CartManager.shared.add(product: product)
        
        // Navigate to Checkout
        let checkoutVC = storyboard?.instantiateViewController(withIdentifier: "CheckOutViewController") as! CheckOutViewController
        self.navigationController?.pushViewController(checkoutVC, animated: true)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
     
        lblPrice.updateGradientFrame()
        lblAddToCartButton.updateGradientFrame()
        discoverPageNavbar.btnTitleNav.updateGradientFrame()
    }
    
    func toggleDescriptionView(show: Bool) {
        isDescriptionVisible = show
           let iconName = show ? "chevron.left" : "chevron.down"
           let icon = UIImage(systemName: iconName)?.withRenderingMode(.alwaysOriginal)
        discoverPageNavbar.btnTitleNav.setImage(icon,for: .normal)
        
        // When visible, bring it back to 0 (sits at bottom)
        descriptionViewBottomConstraint.constant = show ? 0 : priceView.frame.height-descriptionView.frame.height

        UIView.animate(withDuration: 0.8,
                       delay: 0,
                       usingSpringWithDamping: 0.85,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseInOut) {
            self.view.layoutIfNeeded()
        }
    }
    
    
    
    func setupNavTitle() {
        guard let product = product else { return }
        
        discoverPageNavbar.lblTitleNav?.text = product.name
        
        // 1. Change the image (e.g., to a back chevron)
        let backImage = UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysOriginal)
        discoverPageNavbar.btnTitleNav.setImage(backImage, for: .normal)
        
        // 2. Add the back action
        discoverPageNavbar.btnTitleNav.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
        discoverPageNavbar.btnTitleNav.tintColor = .white
        discoverPageNavbar.btnTitleNav.applyBrandGradient(cornerRadius: AppStyle.CornerRadius.button)
        discoverPageNavbar.contentView.backgroundColor = .clear
        discoverPageNavbar.semanticContentAttribute = .forceRightToLeft
    }

    // Add this function to handle the tap
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    

    
    func configureUI() {
        guard let product = product else { return }
        
        prodTitleForDesc.text = product.name
        prodDescription.text  = product.description
        lblPrice.text         = "$ \(product.price)"
        
        // NOW apply gradient — bounds are real at this point
        lblPrice.applyBrandGradient()
//        descriptionView.layer.cornerRadius = 30
        
        self.bikeImages = product.images.compactMap { UIImage(named: $0) }
        if self.bikeImages.isEmpty, let thumb = UIImage(named: product.thumbnail) {
            self.bikeImages = [thumb]
        }
    }
    
    func formattedSpecifications() -> String {
        guard let specs = product?.specifications else { return "" }
        
        return specs.map { "• \($0.key.capitalized): \($0.value)" }
                    .sorted()
                    .joined(separator: "\n\n")
                    .uppercased()
    }
    
    
    func setupDescButtons() {
        
        btnDescription.isSelectedState = true
        btnDescription.titleLabel.text = "Description"
        btnSpecification.titleLabel.text = "Specification"
        btnSpecification.isSelectedState = false
        btnDescription.layer.cornerRadius = 10
        btnSpecification.layer.cornerRadius = 10
        
        btnDescription.actionButton.addTarget(self, action: #selector(descriptionTapped), for: .touchUpInside)
        btnSpecification.actionButton.addTarget(self, action: #selector(specTapped), for: .touchUpInside)
    }
    @objc func descriptionTapped() {
        btnDescription.isSelectedState = true
        btnSpecification.isSelectedState = false
        
        prodTitleForDesc.text = product?.name
        prodDescription.text  = product?.description
        
        toggleDescriptionView(show: true)
    }

    @objc func specTapped() {
        btnDescription.isSelectedState = false
        btnSpecification.isSelectedState = true
        prodDescription.text  = formattedSpecifications()
    }
    
    func setupPageView() {
        pageViewController?.view.translatesAutoresizingMaskIntoConstraints = false
    
        // 1. Clear existing content from container
        topContainerView.subviews.forEach { $0.removeFromSuperview() }
        
        // 2. Initialize PageViewController
        pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        // 3. Create pages from bikeImages
        pages = bikeImages.map { image in
            let vc = ImagePageViewController()
            vc.image = image
            return vc
        }
        
        guard !pages.isEmpty else { return }
        
        // 4. Set first page
        pageViewController.setViewControllers(
            [pages[0]],
            direction: .forward,
            animated: false
        )
        
        
        
        // 5. Add as child
        addChild(pageViewController)
        pageViewController.view.frame = topContainerView.bounds
        pageViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        topContainerView.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
//

    
  
    
    func setupPriceView() {
        if let glassView = priceView as? GlassCardView {
            glassView.cornerRadius = 30
            glassView.roundedCorners = [.topLeft, .topRight]
        }
        
        if let glassDescView = descriptionView as? GlassCardView {
            glassDescView.cornerRadius = 30
            glassDescView.roundedCorners = [.topLeft, .topRight]
        }

        // Center vertically inside priceView
        lblPrice.translatesAutoresizingMaskIntoConstraints = false
        lblAddToCartButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            lblPrice.centerYAnchor.constraint(equalTo: priceView.centerYAnchor),
            lblAddToCartButton.centerYAnchor.constraint(equalTo: priceView.centerYAnchor),
        ])

        lblPrice.applyBrandGradient()
        lblAddToCartButton.applyBrandGradient(cornerRadius: AppStyle.CornerRadius.button)
    }

    

    
    private func applyGradientToText(colors: [CGColor]) {
        
        textGradientLayer.removeFromSuperlayer()
        
        textGradientLayer.colors = colors
        textGradientLayer.startPoint = CGPoint(x: 0, y: 0)
        textGradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        textGradientLayer.frame = lblPrice.bounds
        
        let textMask = CATextLayer()
        textMask.string = lblPrice.text
        textMask.font = lblPrice.font
        textMask.fontSize = lblPrice.font.pointSize
        textMask.alignmentMode = .center
        textMask.contentsScale = UIScreen.main.scale
        textMask.frame = lblPrice.bounds
        
        textGradientLayer.mask = textMask
        
        lblPrice.layer.addSublayer(textGradientLayer)
    }
    
   
    
}
extension DescriptionViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = pages.firstIndex(of: viewController),
              index > 0 else { return nil }
        
        return pages[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = pages.firstIndex(of: viewController),
              index < pages.count - 1 else { return nil }
        
        return pages[index + 1]
    }
}
