//
//  PotraitViewCell.swift
//  CollectionView_Practice
//
//  Created by OBMac-13 on 17/02/26.
//

import UIKit

class PotraitViewCell: UICollectionViewCell {
    
    @IBOutlet weak var potraitImageView: UIImageView!
    
    @IBOutlet weak var potraitLbl: UILabel!
    
    func setup( _ item:ListItem){
        potraitImageView.image = UIImage(named: item.image)
        potraitImageView.layoutIfNeeded()
        potraitLbl.text = item.title
    }
}
