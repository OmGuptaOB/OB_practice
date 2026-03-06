//
//  TableVcCell2.swift
//  TableViewDemo
//
//  Created by OBMac-13 on 20/02/26.
//

import UIKit

class TableVcCell2: UITableViewCell {


 @IBOutlet weak var lblOne: UILabel!
 @IBOutlet weak var imgone: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
