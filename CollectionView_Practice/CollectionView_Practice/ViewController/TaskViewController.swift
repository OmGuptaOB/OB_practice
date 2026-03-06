//
//  TaskViewController.swift
//  CollectionView_Practice
//
//  Created by OBMac-13 on 17/02/26.
//
import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet weak var ShopCV: UICollectionView!
    
    @IBOutlet weak var goDowncv: UICollectionView!
    
    
    var sections: [[String]] = [
        ["Amit", "Rohit", "Shubham", "Jai", "Vivek"]
    ]
    
    var fruits: [[String]] = [
        ["Mango", "Banana", "Pineapple", "Apple", "Orange"]
    ]
    
    var colorArr: [[UIColor]] = [
        [.systemRed, .systemBlue, .systemGreen, .systemYellow, .systemPurple]
    ]

    var fruitsColorArr: [[UIColor]] = [
        []
    ]
    var imagearr = [[#imageLiteral(resourceName: "engin_akyurt-coffee-2242213_1920"),#imageLiteral(resourceName: "bedrck-interior-1961070_1920"),#imageLiteral(resourceName: "kaboompics-coffee-791045_1920"),#imageLiteral(resourceName: "theglassdesk-turntable-1337986_1920"),#imageLiteral(resourceName: "Layer_1")]]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: 100, height: 100)
        
        
        let layout2 = UICollectionViewFlowLayout()
        layout2.scrollDirection = .vertical
        layout2.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout2.itemSize = CGSize(width: 100, height: 100)
        
        ShopCV.delegate = self
        ShopCV.collectionViewLayout = layout
        ShopCV.dataSource = self
        goDowncv.delegate = self
        goDowncv.dataSource = self
        goDowncv.collectionViewLayout = layout2
    }
    
}
extension TaskViewController: UICollectionViewDelegate,UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == ShopCV{
            
            return sections[section].count
        }else{
            return fruits[section].count
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == ShopCV{
            
            return sections.count
        }else{
            return fruits.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == ShopCV{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! cvcell
//            let bgColor = cell.selectedBackgroundView?.backgroundColor
//            cell.contentView.backgroundColor = colorArr[indexPath.section][indexPath.row]
            cell.lblName?.text = sections[indexPath.section][indexPath.row]
            cell.lblName.font = UIFont.systemFont(ofSize: 30)
            
            cell.imageView.image = imagearr[indexPath.section][indexPath.row]
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! cvcell2
            cell.lblcell.font = UIFont.systemFont(ofSize: 30)
//            cell.contentView.backgroundColor = fruitsColorArr[indexPath.section][indexPath.row]
            cell.lblcell?.text = fruits[indexPath.section][indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == ShopCV{
            
            let selectedName = sections[indexPath.section][indexPath.row]
            let selectedImage = imagearr[indexPath.section][indexPath.row]
            
            

            ShopCV.performBatchUpdates({
                
                sections[indexPath.section].remove(at: indexPath.row)
                imagearr[indexPath.section].remove(at: indexPath.row)

                ShopCV.deleteItems(at: [indexPath])

            }, completion: { _ in
                
                let destinationidx = indexPath.row
                
                let destCount = self.fruits[0].count
                
                let insertIndex = destinationidx <= destCount ? destinationidx : destCount

                self.goDowncv.performBatchUpdates({

                    self.fruits[0].insert(selectedName, at: insertIndex)
                    self.goDowncv.insertItems(at: [IndexPath(row: insertIndex, section: 0)])

                })
            })
//            ShopCV.reloadData()
        }else{
            let selectedName =
            fruits[indexPath.section][indexPath.row]
           
           
            goDowncv.performBatchUpdates({

                fruits[indexPath.section].remove(at: indexPath.row)
                goDowncv.deleteItems(at: [indexPath])

            }, completion: { _ in
                let destinationidx = indexPath.row
                let destCount = self.sections[0].count
                
                let insertIndex = destinationidx <= destCount ? destinationidx : destCount
                let randomImage = self.imagearr[0].randomElement()!

                self.ShopCV.performBatchUpdates({

                    self.sections[0].insert(selectedName, at: insertIndex)
                    self.imagearr[0].insert(randomImage, at: insertIndex)

                    self.ShopCV.insertItems(at: [IndexPath(row: insertIndex, section: 0)])

                })
            })
//            goDowncv.reloadData()
        }
    }
    
    
    
    
}
