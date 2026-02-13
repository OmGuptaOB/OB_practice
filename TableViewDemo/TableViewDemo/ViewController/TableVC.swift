//
//  ViewController.swift
//  TableViewDemo
//
//  Created by OBMac-13 on 13/02/26.
//

import UIKit

class TableVC: UIViewController, UITableViewDragDelegate{
    func tableView(_ tableView: UITableView, itemsForBeginning session: any UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let fruit = data[indexPath.row]
             
             let itemProvider = NSItemProvider(object: fruit as NSString)
             let dragItem = UIDragItem(itemProvider: itemProvider)
             
             dragItem.localObject = fruit
             
             return [dragItem]
    }
    
    
    
    
    @IBOutlet weak var tableViewMain: UITableView!
    var data = ["Apple", "Banana", "Mango", "Orange"]

    var sections: [[String]] = [
        ["Apple", "Banana", "Mango", "hell","hge"]
    ]


    
    var arr1 = ["Rahul", "Shubham", "Rohit", "Vishal", "Amit"]
    var arr2 = ["ios", "swift", "node", "java", "c#"]
    var imagearr = [#imageLiteral(resourceName: "engin_akyurt-coffee-2242213_1920"), #imageLiteral(resourceName: "bedrck-interior-1961070_1920"),#imageLiteral(resourceName: "kaboompics-coffee-791045_1920"),#imageLiteral(resourceName: "theglassdesk-turntable-1337986_1920"),#imageLiteral(resourceName: "Layer_1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(tableViewMain)

        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        self.navigationItem.title = "Guest profile"
                self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .automatic
        
        tableViewMain.register(UINib(nibName: "TableVcCell", bundle: nil), forCellReuseIdentifier: "TableVcCell")
        setupTable()
        setupHeaderFooter()
    }
    
    func setupTable(){
        
        tableViewMain.allowsSelection = true
        tableViewMain.separatorColor = UIColor.black
        tableViewMain.rowHeight = 90
        tableViewMain.fillerRowHeight = 0
        //for ipad
        tableViewMain.cellLayoutMarginsFollowReadableWidth = true
        
        tableViewMain.insetsContentViewsToSafeArea = true
        
//        tableViewMain.separatorInset = .zero
//        tableViewMain.layoutMargins = .zero
        tableViewMain.sectionHeaderHeight = 10
        tableViewMain.sectionFooterHeight = 0

        
        tableViewMain.sectionHeaderTopPadding = 0
        
        //seperator color
        tableViewMain.separatorStyle = .singleLine
        tableViewMain.separatorColor = UIColor.green
        
        tableViewMain.separatorEffect = UIBlurEffect(style: .extraLight)
        tableViewMain.separatorInsetReference = .fromCellEdges
        
        //section
        
        print(tableViewMain.numberOfSections)
        print(tableViewMain.numberOfRows(inSection: sections.count - 1))
        
        
        let visibleRect = CGRect(origin: tableViewMain.contentOffset,
                                 size: tableViewMain.bounds.size)

        let indexPaths = tableViewMain.indexPathsForRows(in: visibleRect)
        print(indexPaths)

        tableViewMain.selectRow(at: IndexPath(row: 2, section: 0),
                            animated: true,
                            scrollPosition: .middle)
        
        let indexPath = IndexPath(row: 2, section: 0)
        tableViewMain.reloadRows(at: [indexPath], with: .automatic)
        print(indexPath)
        
        
        sections[0][2] = "Updated"

        tableViewMain.reloadRows(at: [IndexPath(row: 2, section: 0)],
                             with: .fade)

        tableViewMain.reloadSectionIndexTitles()





        
//        if let cell = tableViewMain.cellForRow(at: IndexPath(row: 0, section: 0)) {
//            cell.backgroundColor = .red
//        }

        if let header = tableViewMain.headerView(forSection: 0) {
            header.contentView.backgroundColor = .yellow
        }

      


//        tableViewMain.rowHeight = UITableView.automaticDimension
//        tableViewMain.estimatedRowHeight = 400

    
    }
    
    
    
    func setupHeaderFooter(){
        
        // HEADER VIEW
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 35))
        headerView.backgroundColor = .systemPink
        
//        // FOOTER VIEW
            let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        footerView.backgroundColor = .systemGreen
        
        
        func createlabel(texttoshow : String,viewname : UIView) -> UIButton{
                
            let label = UIButton(frame: viewname.bounds)
            label.setTitle(texttoshow, for: .normal)
            label.setTitleColor(.red, for: .highlighted)
            label.contentMode = .center
            label.tintColor = .white
            label.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                return label
            }
        let lbl1 = createlabel(texttoshow: "WELCOME TO OUR STORE",viewname: headerView)
        lbl1.addTarget(self, action: #selector(removeSection(_ :)), for: .touchUpInside)
        
        let lbl2 = createlabel(texttoshow: "add more",viewname: footerView)
        lbl2.addTarget(self, action: #selector(addSection(_ :)), for: .touchUpInside)
        headerView.addSubview(lbl1)
        footerView.addSubview(lbl2)
            
        tableViewMain.tableHeaderView = headerView
        tableViewMain.tableFooterView = footerView
//        tableViewMain.tableFooterView = UIView()
        
        //drag interaction
        
        tableViewMain.dragInteractionEnabled = true
        tableViewMain.dragDelegate = self


    }

   


}

extension TableVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let desc = storyboard?.instantiateViewController(withIdentifier: "DecriptonVC") as! DecriptonVC
        desc.imag = imagearr[indexPath.row]
        desc.desc = arr2[indexPath.row]
        desc.titleprod = arr1[indexPath.row]
        
        tableViewMain.allowsMultipleSelection = true

        self.navigationController?.pushViewController(desc, animated: true)
        
        tableViewMain.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewMain.dequeueReusableCell(withIdentifier: "TableVcCell" , for: indexPath) as! TableVcCell
        cell.productImage.layer.cornerRadius = 10
        cell.productImage.image = imagearr[indexPath.row]
        cell.productTitle.text = arr1[indexPath.row]
        cell.productDescription.text = arr2[indexPath.row]
//        tableViewMain.indexPathForRow(at: cell)
//        if let visible = tableViewMain.indexPathsForVisibleRows {
//            print("Visible rows: ", visible)
//        }
        return cell
    }
  
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    @objc func addSection(_ sender: Any) {
        
        
        let currentSectionIndex = sections.count - 1
        
      
        sections[currentSectionIndex].append("New Item")
        
        let newRowIndex = sections[currentSectionIndex].count - 1
        let indexPath = IndexPath(row: newRowIndex, section: currentSectionIndex)
        
        tableViewMain.insertRows(at: [indexPath], with: .automatic)
        
        //  If row count becomes 5  create new section
        if sections[currentSectionIndex].count == 5 {
            
            let newSectionIndex = sections.count
            
            sections.append([]) // new empty section
            
            tableViewMain.insertSections(IndexSet(integer: newSectionIndex),
                                         with: .automatic)
        }
    }

    
    @objc func removeSection(_ sender : Any){
        guard sections[0].count > 0 else { return }

               // 1️⃣ Update data
               sections[0].remove(at: 0)

               let indexPath = IndexPath(row: 0, section: 0)

               // 2️⃣ Update table
        tableViewMain.deleteRows(at: [indexPath], with: .fade)
//        sections.remove(at: sections.count-1)
        tableViewMain.reloadData()
    }
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat{
        return 10
    }
    
//    func tableView(_ tableView: UITableView, itemsForBeginning session: any UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
//        <#code#>
//    }

    
}
