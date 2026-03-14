//
//  CollegeListViewController.swift
//  DataBase_Practice
//
//  Created by OBMac-13 on 13/03/26.
//

import UIKit

class CollegeListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var collegeData = [College]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collegeData = DataBaseHelper.shareInstance.getAllCollegeData()
        self.tableView.reloadData()
    }
    
    @IBAction func btnCollegeAdd(_ sender: Any) {
        let collegeForm = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController" ) as! CollegeFormViewController
        
        navigationController?.pushViewController(collegeForm, animated: true)
    }
}
extension CollegeListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.collegeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeTableCell", for: indexPath) as! CollegeTableCell
        cell.college = self.collegeData[indexPath.row]
        return cell
    }
}
