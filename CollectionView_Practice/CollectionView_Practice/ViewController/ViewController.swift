//
//  ViewController.swift
//  CollectionView_Practice
//
//  Created by OBMac-13 on 16/02/26.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var pageCollectionView: UICollectionView!
    
    var imageslist : [UIImage] = [#imageLiteral(resourceName: "img5"),#imageLiteral(resourceName: "img8"),#imageLiteral(resourceName: "img6"),#imageLiteral(resourceName: "img7"),#imageLiteral(resourceName: "img1"),#imageLiteral(resourceName: "img4"),#imageLiteral(resourceName: "img3"),#imageLiteral(resourceName: "img4")]
    var locationName = ["New York","Paris","Rome","Tokyo","London","Sydney","Beijing","Surat"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        //        pageCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        setupCollectionView()
        let longPress = UILongPressGestureRecognizer(
            target: self,
            action: #selector(handleLongPress)
        )
        pageCollectionView.addGestureRecognizer(longPress)
    }
    
    func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        //        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        //        layout.minimumInteritemSpacing = 50
        layout.itemSize = CGSize(width: 100, height: 100)
        //        layout.headerReferenceSize = CGSize(width: view.frame.width, height: 100)
        //        layout.sectionHeadersPinToVisibleBounds = true
        pageCollectionView.allowsSelection = true
        
        pageCollectionView.collectionViewLayout = layout
      
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Delete",
            style: .plain,
            target: self,
            action: #selector(deleteSelectedItems)
        )
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "select",
            style: .plain,
            target: self,
            action: #selector(toggleSelect)
        )

        navigationItem.rightBarButtonItem?.isEnabled = false
//        navigationItem.rightBarButtonItem?.isEnabled = true
        
//        pageCollectionView.dragDelegate = self
//        pageCollectionView.dragInteractionEnabled = false
        
    }
    
    @objc func toggleSelect() {
//        pageCollectionView.dragInteractionEnabled.toggle()
        navigationItem.rightBarButtonItem?.isEnabled.toggle()
        pageCollectionView.allowsMultipleSelection.toggle()
        
        
    }
    
    
    @objc func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        
        switch gesture.state {
            
        case .began:
            guard let indexPath = pageCollectionView.indexPathForItem(
                at: gesture.location(in: pageCollectionView)
            ) else { return }
            
            pageCollectionView.beginInteractiveMovementForItem(at: indexPath)
            
        case .changed:
            pageCollectionView.updateInteractiveMovementTargetPosition(
                gesture.location(in: pageCollectionView)
            )
            
        case .ended:
            pageCollectionView.endInteractiveMovement()
            
        default:
            pageCollectionView.cancelInteractiveMovement()
        }
    }
    
 
    
    func updateDeleteButtonState() {
        let selectedCount = pageCollectionView.indexPathsForSelectedItems?.count ?? 0
        navigationItem.rightBarButtonItem?.isEnabled = selectedCount > 0
    }
    
    
    @objc func deleteSelectedItems() {
        let alert = UIAlertController(
            title: "Delete?",
            message: "Are you sure you want to delete selected items?",
            preferredStyle: .alert
        )

        guard let selectedIndexPaths = pageCollectionView.indexPathsForSelectedItems else { return }
        
        // 🔥 IMPORTANT: Sort descending to avoid index crash
        let sortedIndexPaths = selectedIndexPaths.sorted { $0.item > $1.item }
        
        // 1️⃣ Update data source first
        for indexPath in sortedIndexPaths {
            imageslist.remove(at: indexPath.item)
        }
        
        // 2️⃣ Delete from collection view
        pageCollectionView.deleteItems(at: sortedIndexPaths)
        
        updateDeleteButtonState()
    }


    
    
    @IBAction func deleteFromCollection(_ sender: Any) {
        let alert = UIAlertController(
            title: "Delete?",
            message: "Are you sure you want to delete selected items?",
            preferredStyle: .alert
        )

        guard let selectedIndexPaths = pageCollectionView.indexPathsForSelectedItems else { return }
        
        // 🔥 IMPORTANT: Sort descending to avoid index crash
        let sortedIndexPaths = selectedIndexPaths.sorted { $0.item > $1.item }
        
        // 1️⃣ Update data source first
        for indexPath in sortedIndexPaths {
            imageslist.remove(at: indexPath.item)
            print(indexPath.item , " deleted")
        }
        
        // 2️⃣ Delete from collection view
        pageCollectionView.deleteItems(at: sortedIndexPaths)
        print(sortedIndexPaths , " deleted")
        
        updateDeleteButtonState()
    }
    
    
    
    @IBAction func insertIntoCollection(_ sender: Any) {
        //        pageCollectionView.performBatchUpdates({
        // 1️⃣ Update data source
        imageslist.insert(UIImage(named: "img1")!, at: 0)
        locationName.insert("New Place", at: 0)
        
        // 2️⃣ Tell collection view
        pageCollectionView.insertItems(at: [IndexPath(item: 0, section: 0)])
     
        // }, completion: nil)
        
    }
    
    @IBAction func toggleEdit(_ sender: UIBarButtonItem) {
        
        pageCollectionView.isEditing.toggle()
        
        sender.title = pageCollectionView.isEditing ? "Done" : "Edit"
        
        pageCollectionView.reloadData()
    }

    
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,
                          UICollectionViewDelegateFlowLayout,UICollectionViewDragDelegate{
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: any UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        
              let image = imageslist[indexPath.item]
              
              let itemProvider = NSItemProvider(object: image)
              let dragItem = UIDragItem(itemProvider: itemProvider)
              
              dragItem.localObject = image
              
              return [dragItem]
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageslist.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : MyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        
        cell.contentView.backgroundColor = .lightGray
        cell.imageView.image = imageslist[indexPath.row]
        cell.lblName.text = locationName[indexPath.row]
        return cell
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView,
                        moveItemAt sourceIndexPath: IndexPath,
                        to destinationIndexPath: IndexPath) {
        
        let movedImage = imageslist.remove(at: sourceIndexPath.item)
        imageslist.insert(movedImage, at: destinationIndexPath.item)
        
        let movedName = locationName.remove(at: sourceIndexPath.item)
        locationName.insert(movedName, at: destinationIndexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        updateDeleteButtonState()
        print(pageCollectionView.indexPathsForSelectedItems)
    }

    func collectionView(_ collectionView: UICollectionView,
                        didDeselectItemAt indexPath: IndexPath) {
        updateDeleteButtonState()
        print(pageCollectionView.indexPathsForSelectedItems)
    }
    
    
    //MARK: - should select tem at
    
    func collectionView(_ collectionView: UICollectionView,
                        shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let alert = UIAlertController(
            title: "Warning",
            message: "Cannot select first item !! ",
            preferredStyle: .alert
        )

        // Example: Prevent selecting first item
        return indexPath.item != 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
        
        print("Multi-select started")
    }
    
    //MARK: - Delegate
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        cell.alpha = 0
        UIView.animate(withDuration: 0.3) {
            cell.alpha = 1
        }
    }
    
    //context menu

    
    
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplayContextMenu configuration: UIContextMenuConfiguration,
        animator: UIContextMenuInteractionAnimating?
    ){
        self.pageCollectionView.layer.backgroundColor = UIColor.darkGray.cgColor
    }
    
    func collectionView(_ collectionView: UICollectionView, willEndContextMenuInteraction configuration: UIContextMenuConfiguration, animator: (any UIContextMenuInteractionAnimating)?) {
        self.pageCollectionView.layer.backgroundColor = UIColor.systemGray.cgColor
    }
    
    // delegate FlowLayout
    

    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
//        return CGSize(width: (collectionView.frame.width)/4, height: (collectionView.frame.width)/4)
        
//        let width = collectionView.frame.width
       //        return CGSize(width: width, height: 100)
        
//        let padding: CGFloat = 10
//        let totalSpacing = padding * 3   // left + right + middle
//        
//        let width = (collectionView.frame.width - totalSpacing) / 3
//
//        return CGSize(width: width, height: width)
        
//        let columns: CGFloat = 3
//        let spacing: CGFloat = 8
//
//        let totalSpacing = (columns + 1) * spacing
//        let width = (collectionView.frame.width - totalSpacing) / columns
//
//        return CGSize(width: width, height: width + 40)
        
        if indexPath.item == 0 {
            return CGSize(width: collectionView.frame.width, height: 200)
        } else if indexPath.item == 4{
            let padding: CGFloat = 10
            let totalSpacing = padding * 3
            let width = ((collectionView.frame.width - 16) - totalSpacing)
            return CGSize(width: collectionView.frame.width/1, height: width)
        }else{
            let padding: CGFloat = 10
            let totalSpacing = padding * 3   // left + right + middle
            
            let width = (collectionView.frame.width - totalSpacing) / 3
            
            return CGSize(width: width, height: width)
        }


    }

//for section
//    func collectionView(
//        _ collectionView: UICollectionView,
//        layout collectionViewLayout: UICollectionViewLayout,
//        insetForSectionAt section: Int
//    ) -> UIEdgeInsets {
//        
//        return UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 20)
//    }




    
}

