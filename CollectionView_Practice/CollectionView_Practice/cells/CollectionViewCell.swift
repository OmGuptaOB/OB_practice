//
//  CollectionViewCell.swift
//  CollectionView_Practice
//
//  Created by OBMac-13 on 17/02/26.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
        
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    override var isSelected: Bool {
        didSet {
//            contentView.backgroundColor = isSelected ? .systemBlue : .lightGray
            layer.borderWidth = isSelected ? 3 : 0
            layer.borderColor = UIColor.white.cgColor
        }
    }
    override var isHighlighted: Bool {
        didSet {
            transform = isHighlighted ? CGAffineTransform(scaleX: 0.95, y: 0.95) : .identity
        }
    }
    


}
