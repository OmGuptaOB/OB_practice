//
//  shopCollectionViewCell.swift
//  CollectionView_Practice
//
//  Created by OBMac-13 on 17/02/26.
//

import UIKit

class shopCollectionViewCell: UICollectionViewCell {
    override var isSelected: Bool {
        didSet {
//            contentView.backgroundColor = isSelected ? .systemBlue : .lightGray
            layer.borderWidth = isSelected ? 3 : 0
            layer.borderColor = UIColor.white.cgColor
        }
    }
}
