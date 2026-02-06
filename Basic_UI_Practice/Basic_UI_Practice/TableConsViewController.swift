//
//  TableConsViewController.swift
//  Basic_UI_Practice
//
//  Created by OBMac-13 on 28/01/26.
//

import UIKit

class TableConsViewController: UIViewController {
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    func setupTableView(){
        let tableview = UITableView()
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(ConsTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableview)
        NSLayoutConstraint.activate([
            tableview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
    

}
extension TableConsViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath ) as! ConsTableViewCell
//        cell.backgroundColor =
        cell.cardView.backgroundColor = indexPath.row%2 == 0 ? .blue : .gray
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
   
}
