//
//  NewsViewController.swift
//  SDImageViewer
//
//  Created by OBMac-13 on 13/03/26.
//

import UIKit

class NewsViewController: UIViewController {
    
    var photos: [NewsResponseModel] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = 100
        
     
            fetchData()
    }
    
    
    func fetchData(){
        APIManagerURLSession.shared.fetchPhotos { result in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let data):
                    self.photos = data
                    self.tableView.reloadData()
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
extension NewsViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        let item = photos[indexPath.row]
        
        cell.titleLabel.text = item.author
        
        // Premium pastel colors
        let colors: [UIColor] = [
            UIColor(red: 0.95, green: 0.90, blue: 1.00, alpha: 1.0), // Lavender
            UIColor(red: 0.90, green: 1.00, blue: 0.95, alpha: 1.0), // Mint
            UIColor(red: 1.00, green: 0.95, blue: 0.90, alpha: 1.0), // Peach
            UIColor(red: 0.90, green: 0.95, blue: 1.00, alpha: 1.0), // Sky Blue
            UIColor(red: 1.00, green: 0.90, blue: 0.90, alpha: 1.0)  // Rose
        ]
        cell.contentView.backgroundColor = colors[indexPath.row % colors.count]
        
        if let imageUrlString = item.download_url, let url = URL(string: imageUrlString) {
            cell.titleImage.sd_setImage(with: url,
                                      placeholderImage: UIImage(named: "placeholder"),
                                      options: [.progressiveLoad, .continueInBackground])
        } else {
            cell.titleImage.image = UIImage(named: "placeholder")
        }
        
        return cell
    }
    
}
