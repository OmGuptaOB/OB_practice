//
//  cvcell2.swift
//  CollectionView_Practice
//
//  Created by OBMac-13 on 20/02/26.
//

import UIKit

class cvcell2: UICollectionViewCell {
    
    @IBOutlet weak var lblcell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let selectedView = UIView()
        selectedView.backgroundColor = .systemRed   // 👈 selected color
        
        self.selectedBackgroundView = selectedView
    }
    
}
