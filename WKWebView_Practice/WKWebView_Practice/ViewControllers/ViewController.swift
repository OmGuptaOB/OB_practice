//
//  ViewController.swift
//  WKWebView_Practice
//
//  Created by OBMac-13 on 06/03/26.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var versionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
           let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String

           versionLabel.text = "Version \(version ?? "") (\(build ?? ""))"
        
        let greeter = Greeter()
              greeter.sayHello()
    }
    @IBAction func btnshowWebview(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            
            vc.url = URL(string: "https://www.google.com")
            
            let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
    }
    
}

