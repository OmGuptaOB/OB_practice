//
//  CollegeTableCell.swift
//  DataBase_Practice
//
//  Created by OBMac-13 on 13/03/26.
//

import UIKit

class CollegeTableCell: UITableViewCell {

    @IBOutlet weak var lblCollegeName: UILabel!
    
    @IBOutlet weak var lblUniversityName: UILabel!
    
    @IBOutlet weak var lblCityName: UILabel!
    
    var college : College? {
        didSet {
            lblCollegeName.text = "Name : \(college?.name ?? "")"
            lblUniversityName.text = "University : \(college?.university ?? "")"
            lblCityName.text = "City : \(college?.city ?? "")"
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
