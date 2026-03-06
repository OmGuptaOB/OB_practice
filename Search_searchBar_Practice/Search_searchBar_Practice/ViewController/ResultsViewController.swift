//
//  ResultsViewController.swift
//  Search_searchBar_Practice
//
//  Created by OBMac-13 on 18/02/26.
//

import UIKit

class ResultsViewController: UIViewController {

    var movie: Movie?

    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var genrelabel: UILabel!
    
    @IBOutlet weak var directorLabel: UILabel!
    
    
    @IBOutlet weak var castListtextView: UITextView!
    
    @IBOutlet weak var plotTextView: UITextView!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var posterHeightConstraint: NSLayoutConstraint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        posterImageView.image = UIImage(named: "\(movie?.poster ?? "")")

        if let urlString = movie?.poster,
           let url = URL(string: urlString) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let data = data,
                   let image = UIImage(data: data) {
                    
                    DispatchQueue.main.async {
                        
                        self.posterImageView.image = image
                        
                        let aspectRatio = image.size.height / image.size.width
                        
                        let newHeight = self.posterImageView.frame.width * aspectRatio
                        
                        self.posterHeightConstraint.constant = newHeight
                    }
                }
                
            }.resume()
        }

        posterImageView.contentMode = .scaleAspectFit
        
        titleLabel.text = "\(String(describing: movie!.title)) - \(movie?.year ?? 0)"
        genrelabel.text = movie?.genre.joined(separator: ", ")
        directorLabel.text = movie?.director
        castListtextView.text = movie?.cast.joined(separator: ", ")
        plotTextView.text = movie?.plot
        ratingLabel.text = "IMDB: \(movie?.rating.imdb ?? 0) | RT: \(movie?.rating.rottenTomatoes ?? 0)%"

        
    }
}

