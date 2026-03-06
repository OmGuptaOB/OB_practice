//
//  ProfileViewCell.swift
//  CollectionView_Practice
//
//  Created by OBMac-13 on 17/02/26.
//

import UIKit

class ProfileViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    func setup( _ item:ListItem){
        profileImageView.image = UIImage(named: item.image)
        profileImageView.layoutIfNeeded()
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
    }
}
