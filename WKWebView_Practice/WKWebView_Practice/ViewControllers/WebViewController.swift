//
//  WebViewController.swift
//  WKWebView_Practice
//
//  Created by OBMac-13 on 06/03/26.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var url: URL?
    
    @IBOutlet weak var navView: UIView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var forwardButton: UIButton!
    
    @IBOutlet weak var pageLoader: UIActivityIndicatorView!
    

    let webView: WKWebView = {
          let preferences = WKWebpagePreferences()
          preferences.allowsContentJavaScript = true
          
          let configuration = WKWebViewConfiguration()
          configuration.defaultWebpagePreferences = preferences
          
          return WKWebView(frame: .zero, configuration: configuration)
      }()

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        view.addSubview(webView)
        view.bringSubviewToFront(pageLoader)
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: navView.topAnchor)
        ])
        
        //           if let url = url {
        //               webView.load(URLRequest(url: url))
        //           }
        
        let url = URL(string: "https://google.com")!
        
        if WKWebView.handlesURLScheme(url.scheme ?? "") {
            webView.load(URLRequest(url: url))
        } else {
            UIApplication.shared.open(url)
        }
        
        loadHtml()
        webView.isInspectable = true
        webView.scrollView.isScrollEnabled = true
//        webView.customUserAgent = "MyApp iOS Browser"
        webView.allowsBackForwardNavigationGestures = true
        
        let history = webView.backForwardList

        print(history.backList)
        print(history.forwardList)
    }
    
    @IBAction func goback(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func goForward(_ sender: Any) {
        webView.goForward()
    }
    
    
    @IBAction func reload(_ sender: Any) {
            webView.reload()
       
    }
    
    @IBAction func btnShare(_ sender: Any) {
        guard let url = webView.url else { return }

          let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)

          present(activityVC, animated: true)
    }
    
    
    @IBAction func cancelLoad(_ sender: Any) {
        if webView.isLoading {
            
            webView.stopLoading()
        }else{
            self.dismiss(animated: true)
        }
    }
    
    func updateNavigationButtons() {
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
    }
    
    
    func loadHtml(){
//        let html = """
//        <h1>Hello</h1>
//        <p>This is a test page</p>
//        """
//
//        webView.loadHTMLString(html, baseURL: nil)
        
        let url = URL(string: "https://example.com/file.pdf")!
        let request = URLRequest(url: url)

        webView.startDownload(using: request) { download in
            print(download)
        }
        let config = WKPDFConfiguration()

        webView.createPDF(configuration: config) { result in
            switch result {
            case .success(let data):
                let url = FileManager.default.temporaryDirectory.appendingPathComponent("page.pdf")
                try? data.write(to: url)
                print("PDF saved:", url)

            case .failure(let error):
                print("PDF error:", error)
            }
        }
    }
    
    
    
}
extension WebViewController: WKNavigationDelegate,WKUIDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        updateNavigationButtons()
        pageLoader.stopAnimating()
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        pageLoader.startAnimating()
        updateNavigationButtons()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        pageLoader.stopAnimating()
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        pageLoader.stopAnimating()
    }
    
    func webView(_ webView: WKWebView,
                 runJavaScriptAlertPanelWithMessage message: String,
                 initiatedByFrame frame: WKFrameInfo,
                 completionHandler: @escaping () -> Void) {

        let alert = UIAlertController(title: "Alert",
                                      message: message,
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            completionHandler()
        })

        present(alert, animated: true)
    }
    func webView(_ webView: WKWebView,
                 createWebViewWith configuration: WKWebViewConfiguration,
                 for navigationAction: WKNavigationAction,
                 windowFeatures: WKWindowFeatures) -> WKWebView? {

        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }

        return nil
    }
    
    
    func webView(_ webView: WKWebView,
    runJavaScriptConfirmPanelWithMessage message: String,
    initiatedByFrame frame: WKFrameInfo,
                 completionHandler: @escaping (Bool) -> Void){
        let alert = UIAlertController(title: "Confirm",
                                      message: message,
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
            completionHandler(false)
        })

        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            completionHandler(true)
        })

        present(alert, animated: true)
    }
    
    func webView(_ webView: WKWebView,
    runJavaScriptTextInputPanelWithPrompt prompt: String,
    defaultText: String?,
    initiatedByFrame frame: WKFrameInfo,
                 completionHandler: @escaping (String?) -> Void){
        let alert = UIAlertController(title: prompt,
                                      message: nil,
                                      preferredStyle: .alert)

        alert.addTextField { textField in
            textField.text = defaultText
        }

        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            completionHandler(alert.textFields?.first?.text)
        })

        present(alert, animated: true)
    }
    
    
    //wknavigationdelegate
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

        if let url = navigationAction.request.url {
            print(url)
        }

        decisionHandler(.allow)
    }
}
