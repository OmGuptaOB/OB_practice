//
//  DesignViewController.swift
//  AutoLayout_practice
//
//  Created by OBMac-13 on 04/02/26.
//

import UIKit

class DesignViewController: UIViewController {
    
    
    @IBOutlet weak var imageaspect1: NSLayoutConstraint!
    @IBOutlet weak var imageaspect2: NSLayoutConstraint!
    
//    let image1 = UIImage(named: "p1")
//    let image2 = UIImage(named: "p2")
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let topInset = view.safeAreaInsets.top
            let bottomInset = view.safeAreaInsets.bottom
            
        print("Top Safe Area:", topInset)
        print("Bottom Safe Area:", bottomInset)
        
        let safeFrame = view.safeAreaLayoutGuide.layoutFrame
           print("Safe Area Frame:", safeFrame)
    }
    
    @IBAction func OnClickChangeImage(_ sender: Any){
        
        let tempimg = imageView1.image
    imageView1.image = imageView2.image
    imageView2.image = tempimg
     

    let oldAspect1 = imageaspect1.multiplier
    let oldAspect2 = imageaspect2.multiplier
        
        print("old aspect multiplier value \(oldAspect1) and \(oldAspect2)")
        
        imageaspect1.isActive = false
        imageaspect2.isActive = false
    
      
        print("imageview height anchor 1st :\(imageView1.heightAnchor) and 2nd : \(imageView2.heightAnchor)")
        print("imageview width anchor 1st :\(imageView1.widthAnchor) and 2nd : \(imageView2.widthAnchor)")
        
        imageaspect1 = imageView1.widthAnchor.constraint(equalTo: imageView1.heightAnchor, multiplier: oldAspect2)
        imageaspect2 = imageView2.widthAnchor.constraint(equalTo: imageView2.heightAnchor, multiplier: oldAspect1)
        
        
        print("imageaspect value new : \(imageaspect1.multiplier) and \(imageaspect2.multiplier)")
    
        imageaspect1.isActive = true
        imageaspect2.isActive = true
    
        
        let topInset = view.safeAreaInsets.top
            let bottomInset = view.safeAreaInsets.bottom
            
            print("Top Safe Area:", topInset)
            print("Bottom Safe Area:", bottomInset)

    }
//    {
//        var tempimg = imageView1.image
//        imageView1.image = imageView2.image
//        imageView2.image = tempimg
//
//        let fisrtImageHeight = (imageView1.image?.size.height ?? 100)/(imageView1.image?.size.width ?? 100)
//        let secondImageHeight = (imageView2.image?.size.height ?? 100)/(imageView2.image?.size.width ?? 100)
//        
//        
//        imageaspect1.constant = imageView1.frame.width*fisrtImageHeight
//
//        imageaspect2.constant = imageView2.frame.width*secondImageHeight
//
//        print("heightCons = \(imageaspect1.constant) \(imageaspect2.constant)")
//
//    }

//    var newView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        

//        view.addSubview(newView)
//        
//        newView.backgroundColor = .white
//        newView.translatesAutoresizingMaskIntoConstraints = false
//        newView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        newView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        newView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        newView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        
//        let leftCard = createCardView(imageName: "p1.jpg", title: "Hello World",description: "new to card skfdhjbvkbvhbdfvdfvbfhvbfjhbgvlfvgbflgv new to card skfdhjbvkbvhbdfvdfvbfhvbfjhbgvlfvgbflgv")
//        let rightCard = createCardView(imageName: "p2.jpg", title: "Hello World",description: "new to card")
//        
//        let leftCard2 = createCardView(imageName: "p2.jpg", title: "Hello World",description: "new to card skfdhjbvkbvhbdfvdfvbfhvbfjhbgvlfvgbflgv new to card skfdhjbvkbvhbdfvdfvbfhvbfjhbgvlfvgbflgv")
//        
//        let rightCard2 = createCardView(imageName: "p1.jpg", title: "Hello World",description: "new to card")
////        let rightCard = createCardView(imageName: "p2.jpg")
//
//        NSLayoutConstraint.activate([
//            
//            leftCard.topAnchor.constraint(equalTo: newView.safeAreaLayoutGuide.topAnchor, constant: 16),
//            leftCard.leadingAnchor.constraint(equalTo: newView.leadingAnchor, constant: 16),
//            
//            rightCard.topAnchor.constraint(equalTo: leftCard.topAnchor),
//            rightCard.leadingAnchor.constraint(equalTo: leftCard.trailingAnchor, constant: 16),
//            rightCard.trailingAnchor.constraint(equalTo: newView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            
//            
//            rightCard.widthAnchor.constraint(equalTo: leftCard.widthAnchor),
//            
//            
//            leftCard2.leadingAnchor.constraint(equalTo: newView.leadingAnchor, constant: 16),
//            leftCard2.topAnchor.constraint(equalTo: leftCard.bottomAnchor, constant: 8),
//            leftCard2.widthAnchor.constraint(equalTo: leftCard.widthAnchor),
//            
//            rightCard2.topAnchor.constraint(equalTo: rightCard.bottomAnchor, constant: 8),
//            rightCard2.leadingAnchor.constraint(equalTo: leftCard2.trailingAnchor, constant: 16),
//            rightCard2.trailingAnchor.constraint(equalTo: newView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
//
//            rightCard2.widthAnchor.constraint(equalTo: leftCard2.widthAnchor, constant: 16),
//            
//        ])

        
        
//        func createCardView(imageName: String, title titleText : String,description subText : String)-> UIView{
////            main card
//            let cardView = UIView()
//            newView.addSubview(cardView)
//            cardView.translatesAutoresizingMaskIntoConstraints = false
//            cardView.heightAnchor.constraint(equalToConstant: 220).isActive = true
//
//            cardView.backgroundColor = .black
//            cardView.layer.cornerRadius = 8
//            cardView.clipsToBounds = true
//            
////            imageview
//            let insideCardView = UIImageView()
//            cardView.addSubview(insideCardView)
//            insideCardView.translatesAutoresizingMaskIntoConstraints = false
//            insideCardView.image = UIImage(named: imageName)
//            insideCardView.backgroundColor = .black
//            insideCardView.layer.cornerRadius = 8
//            insideCardView.contentMode = .scaleAspectFill
//            insideCardView.clipsToBounds = true
//            
////            card title
//            
//            let cardTitlelabel = UILabel()
//            cardView.addSubview(cardTitlelabel)
//            cardTitlelabel.translatesAutoresizingMaskIntoConstraints = false
//            cardTitlelabel.textColor = .white
//            cardTitlelabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
//            cardTitlelabel.textAlignment = .center
//            cardTitlelabel.text = titleText
//            
////            card sub title
//            let SubTitlelabel = UILabel()
//            cardView.addSubview(SubTitlelabel)
//            SubTitlelabel.translatesAutoresizingMaskIntoConstraints = false
//            SubTitlelabel.textColor = .white
//            SubTitlelabel.numberOfLines = 0
//            SubTitlelabel.font = UIFont.systemFont(ofSize:10, weight: .medium)
//            SubTitlelabel.adjustsFontSizeToFitWidth = true
//            SubTitlelabel.minimumScaleFactor = 0.6
//            SubTitlelabel.textAlignment = .center
//            SubTitlelabel.text = subText
//            
//            
//            
//            NSLayoutConstraint.activate([
//                //imageview
//                insideCardView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8),
//                insideCardView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
//                insideCardView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),
//                insideCardView.heightAnchor.constraint(equalToConstant: 100),
//                
//                //title lable
//                
//                cardTitlelabel.topAnchor.constraint(equalTo: insideCardView.bottomAnchor, constant: 8),
//                cardTitlelabel.leadingAnchor.constraint(equalTo: insideCardView.leadingAnchor, constant: 8),
//                cardTitlelabel.trailingAnchor.constraint(equalTo: insideCardView.trailingAnchor, constant: 8),
//                
//                //sub title
//                
//                SubTitlelabel.topAnchor.constraint(equalTo: cardTitlelabel.bottomAnchor, constant: 4),
//                SubTitlelabel.leadingAnchor.constraint(equalTo: insideCardView.leadingAnchor, constant: 8),
//                SubTitlelabel.trailingAnchor.constraint(equalTo: insideCardView.trailingAnchor, constant: 8),
//            
//            ])
//           
//            return cardView
//        
//        }
    }
    

}
