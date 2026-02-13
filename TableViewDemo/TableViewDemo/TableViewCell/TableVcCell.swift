//
//  TableVcCell.swift
//  TableViewDemo
//
//  Created by OBMac-13 on 13/02/26.
//

import UIKit

class TableVcCell: UITableViewCell {
    
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productTitle: UILabel!
    
    @IBOutlet weak var productDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
