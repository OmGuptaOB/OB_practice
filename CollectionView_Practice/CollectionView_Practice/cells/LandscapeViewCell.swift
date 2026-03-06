//
//  LandscapeViewCell.swift
//  CollectionView_Practice
//
//  Created by OBMac-13 on 17/02/26.
//

import UIKit

class LandscapeViewCell: UICollectionViewCell {
    @IBOutlet weak var LandScapeImageView: UIImageView!
    
    @IBOutlet weak var LandScapeLbl: UILabel!
    
    func setup( _ item:ListItem){
        LandScapeImageView.image = UIImage(named: item.image)
        LandScapeImageView.layoutIfNeeded()
        LandScapeLbl.text = item.title
    }
}
