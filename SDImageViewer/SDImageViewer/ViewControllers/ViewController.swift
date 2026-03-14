//
//  ViewController.swift
//  SDImageViewer
//
//  Created by OBMac-13 on 09/03/26.
//

import UIKit
import SDWebImage
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var jobTextField: UITextField!
    @IBOutlet weak var responseLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [PostResponse] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func sendRequest(_ sender: Any) {
        
        let name = nameTextField.text ?? ""
        let job = jobTextField.text ?? ""
        
        let request = PostRequest(title: job, body: name, userId: 1, id: 101)
        
      
        
        let params = request.toJSON()
        
        let url = "https://jsonplaceholder.typicode.com/posts"
        APIManager.shared.request(
            endpoint: "/posts",
            method: .post,
            parameters: request.toJSON()
        ) { (result: Result<PostResponse, Error>) in
            
            switch result {
                
            case .success(let post):
                print("Created Post:", post.id ?? 0)
                
            case .failure(let error):
                print("Error:", error)
            }
        }
    }
    
    
    
    @IBAction func getData(_ sender: Any) {
        APIManager.shared.requestArray(
            endpoint: "/posts",
            method: .get
        ) { (result: Result<[PostResponse], Error>) in
            
            switch result {
                
            case .success(let posts):
                self.posts = posts
                self.tableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    @IBAction func updateData(_ sender: Any) {
      
        let name = nameTextField.text ?? ""
        let job = jobTextField.text ?? ""
        let request = PostRequest(title: job, body: name, userId: 1 ,id: 1)
        
//        let updatedParams = request.toJSON()
        
        APIManager.shared.request(
               endpoint: "/posts",
               method: .put,
               parameters: request.toJSON()
           ) { (result: Result<PostResponse, Error>) in
               
                switch result {
                    
                case .success(let post):
                    self.responseLabel.text =
                    "updated values \nID: \(post.id ?? 0)\nTitle: \(post.title ?? "")\nBody: \(post.body ?? "")"
                    
                    
                case .failure(let error):
                    print("Error:", error)
                }
            }
    }
    
    @IBAction func deleteData(_ sender: Any) {
        
        let deleteUrl = "https://jsonplaceholder.typicode.com/posts/1"
        AF.request(deleteUrl, method: .delete)
        .response { response in
            
            if let statusCode = response.response?.statusCode {
                
                if statusCode == 200 || statusCode == 204 {
                    self.responseLabel.text = "Post deleted successfully"
                } else {
                    self.responseLabel.text = "Delete failed"
                }
            }
        }
    }
    
}

extension ViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let post = posts[indexPath.row]
        cell.textLabel?.text = post.title ?? "No Title"
        cell.detailTextLabel?.text = post.body ?? "No Body"
        return cell
    }
    
    
}

