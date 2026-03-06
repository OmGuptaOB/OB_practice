//
//  FirstVC.swift
//  ContainerView_Practice
//
//  Created by OBMac-13 on 03/03/26.
//

import UIKit

class FirstVC: UIViewController {
    
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var lblDesc: UILabel!
    
    @IBOutlet weak var planView: UIView!
    
    @IBOutlet weak var tableViewPlans: UITableView!
    
    
    var imageName: String?
    var descriptionText: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setupPlanView()
        tableViewPlans.dataSource = self
        tableViewPlans.delegate = self
        tableViewPlans.register(
                UINib(nibName: "PlanCell", bundle: nil),
                forCellReuseIdentifier: "PlanCell"
            )
    }
    
    func updateUI() {
        imageview.image = UIImage(named: imageName ?? "")
        lblDesc.text = descriptionText
        lblDesc.textColor = .white
        lblDesc.attributedText = NSAttributedString(string: lblDesc.text ?? "", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)]
        )
    }
    
    func setupPlanView() {
        planView.layer.cornerRadius = 18
        planView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        planView.clipsToBounds = true
    }
    
}
extension FirstVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanCell" , for: indexPath) as! PlanCell
        return cell
    }
}

