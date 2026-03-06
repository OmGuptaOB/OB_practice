//
//  cvcell.swift
//  CollectionView_Practice
//
//  Created by OBMac-13 on 20/02/26.
//

import UIKit

class cvcell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let selectedView = UIView()
        selectedView.backgroundColor = .systemBlue   // 👈 selected color
        
        self.selectedBackgroundView = selectedView
    }
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
