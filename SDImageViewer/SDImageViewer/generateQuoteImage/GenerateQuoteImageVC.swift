//
//  GenerateQuoteImageVC.swift
//  SDImageViewer
//
//  Created by OBMac-13 on 11/03/26.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SDWebImage

class GenerateQuoteImageVC: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var mainImageAspectConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var quoteTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIsImlzcyI6Imh0dHBzOi8vYWRtYWtlci5ncmFwaGljZGVzaWducy5jby5pbi9hcGkvcHVibGljL2FwaS9kb0xvZ2luRm9yR3Vlc3QiLCJpYXQiOjE3NzMxMzg2MzYsImV4cCI6MTc3Mzc0MzQzNiwibmJmIjoxNzczMTM4NjM2LCJqdGkiOiJaMTVLeUxHa295cjhCMEVtIn0.x6N5GaHUvTLPKo7q9CWDPAVa4XsFVC6ewfCbz8hYy20"
    
    
    func sendQuoteGenerationRequest() {
        let quote = quoteTextField.text ?? ""
        
        
        let headers: HTTPHeaders =
        ["Authorization": "Bearer \(token)",
        "Content-Type": "application/json"]
     
        let request = QuoteRequest(user_input: quote, platform: "2", device_uuid: "31B1A219-1544-4D90-9BBD-E041A848391F")
        
        let params = request.toJSON()
        
//        let url = "http://192.168.0.110/photo_editor_lab_backend/api/public/api"
        //almofire methods
        APIManager.shared.request(
            endpoint: "/generateQuoteImage",
            method: .post,
            parameters: request.toJSON(),
            headers: headers
        ) { (result: Result<SuccessResponse, Error>) in
            
            switch result {
                
            case .success(let response):
                guard let imageUrl = response.data?.url,
                      let width = response.data?.width,
                      let height = response.data?.height,
                      let url = URL(string: imageUrl) else { return }
                
                // Update aspect ratio
                let aspectRatio = height / width
                self.mainImageAspectConstraint.constant = aspectRatio
                
                // Load image
                self.mainImageView.sd_setImage(with: url)
                
                // Refresh layout
                self.view.layoutIfNeeded()
                print("""
                       Created Quote image
                       
                       code: \(response.code ?? 0)
                       message: \(response.message ?? "")
                       cause: \(response.cause ?? "")
                       url: \(response.data?.url ?? "")
                       """)
                
            case .failure(let error):
                print("Request Failed:", error.localizedDescription)
            }
        }
        
//        APIManagerURLSession.shared.generateQuoteImage(
//            requestData: request,
//            token: token
//        ) { result in
//            
//            switch result {
//                
//            case .success(let response):
//                print("""
//                       Created Quote image
//                       
//                       code: \(response.code ?? 0)
//                       message: \(response.message ?? "")
//                       cause: \(response.cause ?? "")
//                       url: \(response.data?.url ?? "")
//                       """)
//                
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
    }
    
    @IBAction func sendImageRequest(_ sender: Any) {
//        sendQuoteGenerationRequest()
        generateBaby()
    }
    
    
    func generateBaby() {
        guard let fatherImage = UIImage(named: "cavil"),
              let motherImage = UIImage(named: "p1") else { return }
        
        let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIsImlzcyI6Imh0dHBzOi8vYWRtYWtlci5ncmFwaGljZGVzaWducy5jby5pbi9hcGkvcHVibGljL2FwaS9kb0xvZ2luRm9yR3Vlc3QiLCJpYXQiOjE3NzMxMzg2MzYsImV4cCI6MTc3Mzc0MzQzNiwibmJmIjoxNzczMTM4NjM2LCJqdGkiOiJaMTVLeUxHa295cjhCMEVtIn0.x6N5GaHUvTLPKo7q9CWDPAVa4XsFVC6ewfCbz8hYy20"
        
        let headers: HTTPHeaders =
        ["Authorization": "Bearer \(token)",
        "Content-Type": "application/json"]
    

        let requestData = BabyRequestData(gender: "boy",device_uuid: "31B1A219-1544-4D90-9BBD-E041A848391F",platform: "2")

//        APIManager.shared.uploadBabyImages(
//            fatherImage: fatherImage,
//            motherImage: motherImage,
//            requestData: requestData,
//            headers: headers
//        ) { result in
//
//            switch result {
//
//            case .success(let response):
//
//                print("Success:", response.message ?? "")
//
//                if let imageUrl = response.data?.url {
//                    print("Generated Baby Image:", imageUrl)
//                }
//
//            case .failure(let error):
//
//                print("Upload Failed:", error.localizedDescription)
//            }
//        }
        
        APIManagerURLSession.shared.uploadBabyImages(fatherImage: fatherImage, motherImage: motherImage, requestData: requestData, token: token)
        { (result : Result<SuccessResponse,Error>) in
            switch result {
                
            case .success(let response):
                
                print("Success:", response.message ?? "")
                
                if let imageUrl = response.data?.url {
                    print("Generated Baby Image:", imageUrl)
                }
                
            case .failure(let error):
                
                print("Upload Failed:", error.localizedDescription)
            }
        }
        
        
    }
    
}
