//
//  ProductDetailCell.swift
//  Cycle_Shop_practice
//
//  Created by OBMac-13 on 26/02/26.
//

import UIKit

class ProductDetailCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var lblproductTitle: UILabel!
    
    @IBOutlet weak var lblProductPrice: UILabel!
    
    @IBOutlet weak var stepProductQuantity: UIView!
    
    
    @IBOutlet weak var totalProdDiscount: UILabel!
    
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var lblQuantity: UILabel!
    var quantityChanged: ((Int) -> Void)?
    
    var quantity: Int = 1 {
        didSet {
            lblQuantity.text = "\(quantity)"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUi()
    }
    
    func setupUi(){
        productImageView.layer.cornerRadius = 10
        stepProductQuantity.layer.cornerRadius = 10
        
        btnPlus.applyBrandGradient(cornerRadius: AppStyle.CornerRadius.minibutton)
        
        stepProductQuantity.backgroundColor = AppStyle.Colors.buttonSelected
        
        btnMinus.applyDarkGradient(cornerRadius: AppStyle.CornerRadius.minibutton)
    }
    
    @IBAction func minusTapped(_ sender: UIButton) {
        if quantity > 0 {
            quantity -= 1
            quantityChanged?(quantity)
        }
    }

    @IBAction func plusTapped(_ sender: UIButton) {
        quantity += 1
        quantityChanged?(quantity)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
