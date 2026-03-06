//
//  ViewController.swift
//  Cycle_Shop_practice
//
//  Created by OBMac-13 on 24/02/26.
//

import UIKit

class ViewController: UIViewController {
  
 
    var iconList : [UIImage] = [#imageLiteral(resourceName: "All"),#imageLiteral(resourceName: "Bike_figma"),#imageLiteral(resourceName: "Road_figma"),#imageLiteral(resourceName: "Mountain_figma"),#imageLiteral(resourceName: "Helmet_figma"),#imageLiteral(resourceName: "Heart_figma")]
//    var discountList  = ["30% Off","20% Off","15% Off","30% Off"]
    
    var products: [Product] = []
    var filteredProducts: [Product] = []
    var selectedProductForBanner: Product?
    var selectedCategoryIndex: Int = 0
    let categories = ["All", "Road Bike", "Mountain Bike", "Electric Bike", "Road Helmet", "Favorites"]
    
    
    @IBOutlet weak var pageCollectionView: UICollectionView!
    
    @IBOutlet weak var discoverPageNavbar: ClearNavigationBar!
    
//    @IBOutlet weak var searchBarnav: UISearchBar!
    
//    @IBOutlet weak var searchbarHeight: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        setupNavTitle()
        
        loadProducts()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupCollectionView()
        discoverPageNavbar.btnTitleNav.updateGradientFrame()
    }
    
    
    
    func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        pageCollectionView.collectionViewLayout = layout
    }
    
       
        
    func setupNavTitle() {
        discoverPageNavbar.lblTitleNav?.text = "Choose Your Bike"
        discoverPageNavbar.btnTitleNav2?.isHidden = true
//        discoverPageNavbar.btnTitleNav?.isHidden = true
        discoverPageNavbar.btnTitleNav.tintColor = .white  // keeps icon white on top of gradient
    
        discoverPageNavbar.btnTitleNav.applyBrandGradient(cornerRadius: AppStyle.CornerRadius.button)
        
//        discoverPageNavbar.btnTitleNav.applyBrandGradient(cornerRadius: AppStyle.CornerRadius.button)

        discoverPageNavbar.contentView.backgroundColor = .clear
        discoverPageNavbar.semanticContentAttribute = .forceLeftToRight
    }
    
    
    func loadProducts() {
        guard let url = Bundle.main.url(forResource: "app-data", withExtension: "json") else {
            print("JSON file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(ProductResponse.self, from: data)
            self.products = response.products
            
            // Apply saved liked states
            let likedIDs = FavoriteManager.shared.getLikedIDs()
            for i in 0..<self.products.count {
                if likedIDs.contains(self.products[i].id) {
                    self.products[i].isLiked = true
                }
            }
            
            self.filteredProducts = self.products // Initial state is "All"
            self.selectedProductForBanner = products.first
            self.pageCollectionView.reloadData()
        } catch {
            print("Error loading JSON: \(error)")
        }
    }
        
    }
    
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1{
            return categories.count
        }else{
            return filteredProducts.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0  {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as! CVBannerCell
            
            if let product = selectedProductForBanner {
                cell.imgBanner.image = UIImage(named: product.thumbnail)
                cell.lbldiscount.text = "\(product.discountPercent)% Off"
            }
            
            return cell
        }else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "miniCell", for: indexPath) as! CVMiniCell
            cell.configureGradient(isSelected: indexPath.item == selectedCategoryIndex)
            cell.imgViewMini.image = iconList[indexPath.row]
            
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CVCell
            
            let product = filteredProducts[indexPath.row]
            cell.imgProduct.image = UIImage(named: product.thumbnail)
            cell.setLiked(product.isLiked)
            
            cell.didTapLike = { [weak self] in
                guard let self = self else { return }
                
                // 1. Update the state in the displayed (filtered) list
                self.filteredProducts[indexPath.item].isLiked.toggle()
                let newState = self.filteredProducts[indexPath.item].isLiked
                
                // 2. Sync with the master products list
                if let masterIndex = self.products.firstIndex(where: { $0.id == product.id }) {
                    self.products[masterIndex].isLiked = newState
                }
                
                // 3. Update Persistence
                FavoriteManager.shared.save(productId: product.id, isLiked: newState)
                
                // 4. Immediate UI Update
                cell.setLiked(newState)
                
                // 5. If we are in "Favorites" category, the item should be removed
                let currentCategory = self.categories[self.selectedCategoryIndex]
                if currentCategory == "Favorites" && !newState {
                    self.filteredProducts = self.products.filter { $0.isLiked }
                    self.pageCollectionView.reloadSections(IndexSet(integer: 2))
                }
            }
            
            cell.lblproduct.text = product.category
            cell.lblProductId.text = product.name
            
            cell.lblProductPrice.text = "$\(product.price)"
                        
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            selectedCategoryIndex = indexPath.item
            let category = categories[selectedCategoryIndex]
            
            if category == "All" {
                filteredProducts = products
            } else if category == "Favorites" {
                filteredProducts = products.filter { $0.isLiked }
            } else {
                filteredProducts = products.filter { $0.category == category }
            }
            
            collectionView.reloadSections(IndexSet(integersIn: 1...2))
            
        } else if indexPath.section == 2 {
            selectedProductForBanner = filteredProducts[indexPath.row]
            collectionView.reloadSections(IndexSet(integer: 0))
            collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
        } else if indexPath.section == 0 {
            let desc = storyboard?.instantiateViewController(withIdentifier: "DescriptionViewController") as! DescriptionViewController
            desc.product = selectedProductForBanner
            self.navigationController?.pushViewController(desc, animated: true)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 0 {
            return UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)
        } else if section == 1{
            return UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)
        }else{
            return UIEdgeInsets(top: 10, left: 10, bottom: 30, right: 10)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = pageCollectionView.bounds.width
        if indexPath.section == 0 {
            let padding: CGFloat = 15
            let totalSpacing = padding * 2   // left + right + middle
            
            let width = (collectionView.frame.width - totalSpacing)
            return CGSize(width: width, height: 250)
            
        }else if indexPath.section == 1 {
            
            let itemsPerRow: CGFloat = CGFloat(iconList.count)
            let spacing: CGFloat = 10
            let leftRightInset: CGFloat = 10   // 10 left + 10 right
            
            let totalSpacing = leftRightInset + (spacing * (itemsPerRow - 1))
            
            let width = (collectionView.frame.width - totalSpacing) / itemsPerRow
            
            // ipad → fixed height 60 to make icons readable
            if UIDevice.current.userInterfaceIdiom == .pad {
                return CGSize(width: width, height: 60)
            } else {
                return CGSize(width: width, height: width)
            }
        }else {
            
            let spacing: CGFloat = 10
            let leftRightInset: CGFloat = 20
            
            let columns: CGFloat = collectionView.frame.width > 600 ? 4 : 2
            
            let totalSpacing = leftRightInset + (spacing * (columns - 1))
            
            let width = (collectionView.frame.width - totalSpacing) / columns
            return CGSize(width: width, height: width * 1.3)
        }
    }
    
}

