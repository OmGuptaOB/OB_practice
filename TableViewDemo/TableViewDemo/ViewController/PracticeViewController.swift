//
//  PracticeViewController.swift
//  TableViewDemo
//
//  Created by OBMac-13 on 19/02/26.
//

import UIKit

class PracticeViewController: UIViewController{
    
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var tableview2: UITableView!
    
    
    var sections: [[String]] = [
        ["Amit", "Rohit", "Shubham", "Jai", "Vivek"]
    ]
    
    var fruits: [[String]] = [
        ["Mango", "Banana", "Pineapple", "Apple", "Orange"]
    ]
    
    var imagearr = [[
        #imageLiteral(resourceName: "engin_akyurt-coffee-2242213_1920"),
        #imageLiteral(resourceName: "bedrck-interior-1961070_1920"),
        #imageLiteral(resourceName: "kaboompics-coffee-791045_1920"),
        #imageLiteral(resourceName: "theglassdesk-turntable-1337986_1920"),
        #imageLiteral(resourceName: "Layer_1")]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview2.delegate = self
        tableview2.dataSource = self
        
    }

}

extension PracticeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableview {
              return sections[section].count
          }
          else {
              return fruits[section].count
          }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        if tableView == tableview {
            
             let selectedName =
                    sections[indexPath.section][indexPath.row]
            
            sections[indexPath.section].remove(at: indexPath.row)
            tableview.deleteRows(at: [indexPath],
                                 with: .left)
            
            let destinationidx = indexPath.row
              let destCount = fruits[0].count
            
            let insertIndex = destinationidx <= destCount ? destinationidx : destCount
            
            fruits[0].insert(selectedName, at: insertIndex)

            tableview2.insertRows(at: [IndexPath(row: insertIndex, section: 0)], with: .automatic)
            tableview.reloadData()
        }else{
//            
//            guard let selectedIndexPaths =
//                    tableview2.indexPathForSelectedRow?.first else {
//                return
//            }
                 let selectedName =
                fruits[indexPath.section][indexPath.row]
                
                fruits[indexPath.section].remove(at: indexPath.row)
            tableview2.deleteRows(at: [indexPath],
                                 with: .left)
            let destinationidx = indexPath.row
              let destCount = sections[0].count
            
            let insertIndex = destinationidx <= destCount ? destinationidx : destCount
            sections[0].insert(selectedName, at: insertIndex)

            let randomImage = imagearr[0].randomElement()!
                imagearr[0].insert(randomImage, at: insertIndex)
            
            
                tableview.insertRows(at: [IndexPath(row: insertIndex, section: 0)], with: .automatic)
            tableview2.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tableview {
            let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as! TableVcCell2
            tableview.rowHeight = 100
            cell.lblOne?.text  = sections[indexPath.section][indexPath.row]
            cell.imgone?.image  =  imagearr[indexPath.section][indexPath.row]
            
            return cell
            
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            tableview2.rowHeight = 70
            cell.textLabel?.text = fruits[indexPath.section][indexPath.row]
            return cell
        }
      
       
    }
}




