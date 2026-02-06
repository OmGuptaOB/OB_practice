//
//  ConsTableViewCell.swift
//  Basic_UI_Practice
//
//  Created by OBMac-13 on 28/01/26.
//

import UIKit

class ConsTableViewCell: UITableViewCell {

    var cardView : UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCardView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupCardView(){
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        let cardView = UIView()
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = .systemGray6
        cardView.layer.cornerRadius = 14.0
        self.cardView = cardView
        self.addSubview(cardView)
        
        
        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: 15),
            cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor , constant: -15),
            cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    

}
