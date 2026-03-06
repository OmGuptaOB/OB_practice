//
//  NavBarViewController.swift
//  Navigation_Controller_Practice
//	
//  Created by OBMac-13 on 09/02/26.
//

import UIKit

class NavBarViewController: UIViewController {

    @IBOutlet weak var btnFirst: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .white
        self.navigationItem.title = "NavBAR"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .never
        navigationItem.backButtonDisplayMode = .minimal
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: nil)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "house"), style: .plain, target: self, action: #selector(didTapButton))
        
        // 1️⃣ Home Icon
               let homeItem = UIBarButtonItem(
                   image: UIImage(systemName: "house"),
                   style: .plain,
                   target: self,
                   action: #selector(homeTapped)
               )
               
               // 2️⃣ Search Icon
               let searchItem = UIBarButtonItem(
                   image: UIImage(systemName: "magnifyingglass"),
                   style: .plain,
                   target: self,
                   action: #selector(searchTapped)
               )
               
               // 3️⃣ Settings Text
               let settingsItem = UIBarButtonItem(
                   title: "Settings",
                   style: .plain,
                   target: self,
                   action: #selector(settingsTapped)
               )
        
        
        // 1️⃣ Home Icon
               let plusitem = UIBarButtonItem(
                   image: UIImage(systemName: "plus"),
                   style: .plain,
                   target: self,
                   action: #selector(homeTapped)
               )
               
               // 2️⃣ Search Icon
               let cancelItem = UIBarButtonItem(
                   image: UIImage(systemName: "pencil.slash"),
                   style: .plain,
                   target: self,
                   action: #selector(searchTapped)
               )
               
               // 3️⃣ Settings Text
               let NotingItem = UIBarButtonItem(
                   title: "Noting",
                   style: .plain,
                   target: self,
                   action: #selector(settingsTapped)
               )
        
        let menu = UIMenu(title: "", children: [
            UIAction(title: "Cancel", image: UIImage(systemName: "pencil.slash"), handler: { _ in }),
            UIAction(title: "Noting", handler: { _ in })
        ])

        let moreItem = UIBarButtonItem(
            image: UIImage(systemName: "ellipsis.circle"),
            menu: menu
        )

        navigationItem.rightBarButtonItems = [plusitem, moreItem]
        navigationItem.leftBarButtonItems = [homeItem, searchItem, settingsItem]
//        navigationItem.rightBarButtonItems = [plusitem,cancelItem,NotingItem]
//
        
        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(didTapButton))
        
//        var config = UIButton.Configuration.filled()
//        config.image = UIImage(systemName: "arrow.right")
//        config.imagePlacement = .trailing   // right side
//        config.imagePadding = 2
//        btnFirst.configuration = config
        
        btnFirst.setTitle("Edit ", for: .normal)
        btnFirst.setImage(UIImage(systemName: "person"), for: .normal)
        btnFirst.tintColor = .white
        
        let rightImageView = UIImageView(image: UIImage(systemName: "pencil.circle"))
        rightImageView.translatesAutoresizingMaskIntoConstraints = false

        btnFirst.addSubview(rightImageView)

        NSLayoutConstraint.activate([
            rightImageView.centerYAnchor.constraint(equalTo: btnFirst.centerYAnchor),
            rightImageView.trailingAnchor.constraint(equalTo: btnFirst.trailingAnchor, constant: -10),
            rightImageView.widthAnchor.constraint(equalToConstant: 30),
            rightImageView.heightAnchor.constraint(equalToConstant: 30)
        ])



            //using stack
//        let leftImage = UIImageView(image: UIImage(systemName: "person"))
//        
//        let label = UILabel()
//        label.text = "1 to 2"
//        
//        let rightImage = UIImageView(image: UIImage(systemName: "pencil.circle"))
//
//        let stack = UIStackView(arrangedSubviews: [leftImage, label, rightImage])
//        stack.axis = .horizontal
//        stack.spacing = 8
//        stack.alignment = .center
//        stack.translatesAutoresizingMaskIntoConstraints = false
//
//        btnFirst.addSubview(stack)
//
//        NSLayoutConstraint.activate([
//            stack.centerXAnchor.constraint(equalTo: btnFirst.centerXAnchor),
//            stack.centerYAnchor.constraint(equalTo: btnFirst.centerYAnchor)
//        ])
            

    }
    @objc func homeTapped() {
            print("Home tapped")
        }
        
        @objc func searchTapped() {
            print("Search tapped")
        }
        
        @objc func settingsTapped() {
            print("Settings tapped")
        }
    
    
    @objc func didTapButton() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondNavBarViewController") as! SecondNavBarViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("button clicked")
    }
    
    @IBAction func onClickGotoSecondScreen(_ sender: Any) {
        didTapButton()
    }
    

}
