//
//  NewsTableViewCell.swift
//  SDImageViewer
//
//  Created by OBMac-13 on 13/03/26.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleImage.image = nil
        titleLabel.text = nil
        contentView.backgroundColor = .clear
        // Cancel loading if any
        titleImage.sd_cancelCurrentImageLoad()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
