//
//  ProgressDemoVC.swift
//  UIElements_Practice
//
//  Created by OBMac-13 on 12/02/26.
//
import UIKit

class ProgressDemoVC: UIViewController {
    
    var timer: Timer?

    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var lblProgressDesc: UILabel!
    
    @IBOutlet weak var loadarInitial: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
      

        setupProgressView()
        startFakeDownload()
      

    }
    
    func setupProgressView() {
        progressView.progressTintColor = .systemGreen
        progressView.trackTintColor = .systemGray5
        progressView.progressViewStyle = .bar
        loadarInitial.startAnimating()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        progressView.transform = progressView.transform.scaledBy(x: 2, y: 5)
    }
    
    func startFakeDownload() {
        progressView.progress = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1,
                                     repeats: true) { _ in
            
            if self.progressView.progress < 0.3 {
                self.progressView.setProgress(
                    self.progressView.progress + 0.02,
                    animated: true
                )
            } else if self.progressView.progress < 0.5  {
                self.progressView.setProgress(
                    self.progressView.progress + 0.02,
                    animated: true
                )
                self.lblProgressDesc.text = "loading resources..."
                
            }else if self.progressView.progress < 1.0  {
                self.progressView.setProgress(
                    self.progressView.progress + 0.02,
                    animated: true
                )
                self.lblProgressDesc.text = "just a moment..."
            }else {
                self.timer?.invalidate()
                self.lblProgressDesc.text = "Download complete"
                print("Download complete")
                self.loadarInitial.stopAnimating()
                self.loadarInitial.hidesWhenStopped = true
                let  SwitchDemoVC = self.storyboard?.instantiateViewController(withIdentifier: "SwitchDemoVC") as! SwitchDemoVC
                self.present( SwitchDemoVC, animated: true)
               
            }
        }
    }
}

