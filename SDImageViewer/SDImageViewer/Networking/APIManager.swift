//
//  APIManager.swift
//  SDImageViewer
//
//  Created by OBMac-13 on 10/03/26.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

let postsBaseURL = "http://192.168.0.110/photo_editor_lab_backend/api/public/api"
let newsDataBaseURL = "https://picsum.photos/v2/list"

class APIManager {
    
    static let shared = APIManager()
    
    private init() {}
    
}


extension APIManager{
    
    func request<T: Mappable>(
        endpoint: String,
        method: HTTPMethod,
        parameters: [String: Any]? = nil,
        headers: HTTPHeaders? = nil,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        
        let url = postsBaseURL + endpoint
        
        AF.request(url,
                   method: method,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
        
        .responseObject { (response: AFDataResponse<T>) in
            
            switch response.result {
                
            case .success(let data):
                completion(.success(data))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func uploadBabyImages(
        fatherImage: UIImage,
        motherImage: UIImage,
        requestData: BabyRequestData,
    headers:HTTPHeaders,
        completion: @escaping (Result<SuccessResponse, Error>) -> Void
    ) {

        let url = postsBaseURL + "/generateBabyFaceImage"

        AF.upload(multipartFormData: { multipartFormData in
            
            // Father Image
            if let fatherData = fatherImage.jpegData(compressionQuality: 0.8) {
                multipartFormData.append(
                    fatherData,
                    withName: "father_image",
                    fileName: "father.jpg",
                    mimeType: "image/jpeg"
                )
            }

            // Mother Image
            if let motherData = motherImage.jpegData(compressionQuality: 0.8) {
                multipartFormData.append(
                    motherData,
                    withName: "mother_image",
                    fileName: "mother.jpg",
                    mimeType: "image/jpeg"
                )
            }

            // Request Data JSON
            if let jsonData = try? JSONSerialization.data(
                withJSONObject: requestData.toJSON(),
                options: []
            ) {
                multipartFormData.append(
                    jsonData,
                    withName: "request_data"
                )
            }

        },  to: url,
                  method: .post,
                  headers: headers)

        .responseObject { (response: AFDataResponse<SuccessResponse>) in
            
            switch response.result {

            case .success(let data):
                completion(.success(data))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestArray<T: Mappable>(
        endpoint: String,
        method: HTTPMethod,
        parameters: [String: Any]? = nil,
        completion: @escaping (Result<[T], Error>) -> Void
    ) {
        
        let url = postsBaseURL + endpoint
        
        AF.request(url,
                   method: method,
                   parameters: parameters,
                   encoding: JSONEncoding.default)
        
        .responseArray { (response: AFDataResponse<[T]>) in
            
            switch response.result {
                
            case .success(let data):
                completion(.success(data))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
}


class APIManagerURLSession {

    static let shared = APIManagerURLSession()
    
    private init() {}
    
    let postsBaseURL = "http://192.168.0.110/photo_editor_lab_backend/api/public/api"
}

extension APIManagerURLSession{
    
    
    func generateQuoteImage(
        requestData: QuoteRequest,
        token: String,
        completion: @escaping (Result<SuccessResponse, Error>) -> Void
    ) {
        
        let endpoint = "/generateQuoteImage"
        
        guard let url = URL(string: postsBaseURL + endpoint) else { return }
        
        var request = URLRequest(url: url)
        //set http method
        request.httpMethod = "POST"
        
        //        set header
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        //convert model to json and json to data
        let json = requestData.toJSON()
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: json)
        }catch{
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard  let data = data else {
                return
            }
            print(String(data: data, encoding: .utf8) ?? "")
            
            //  Decode response after sending data
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let result = SuccessResponse(JSON: json) {
                        DispatchQueue.main.async {
                            completion(.success(result))
                        }
                    }
                }
            }catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            
        }
        task.resume()
    }
    
    
    func uploadBabyImages(
        fatherImage: UIImage,
        motherImage: UIImage,
        requestData: BabyRequestData,
        token: String,
        completion: @escaping (Result<SuccessResponse, Error>) -> Void
    ) {
        let endpoint = "/generateBabyFaceImage"
        
        guard let url = URL(string: postsBaseURL + endpoint) else {
            return
        }
        
        var request = URLRequest(url: url)
        //method
        
        request.httpMethod = "POST"
        
        let boundary = UUID().uuidString
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        var body = Data()
        func append(_ string: String) {
            if let data = string.data(using: .utf8) {
                body.append(data)
            }
        }
        
        if let fatherData = fatherImage.jpegData(compressionQuality: 0.8) {
            
            append("--\(boundary)\r\n")
            append("Content-Disposition: form-data; name=\"father_image\"; filename=\"father.jpg\"\r\n")
            append("Content-Type: image/jpeg\r\n\r\n")
            
            body.append(fatherData)
            append("\r\n")
        }
        
        if let motherData = motherImage.jpegData(compressionQuality: 0.8) {
            
            append("--\(boundary)\r\n")
            append("Content-Disposition: form-data; name=\"mother_image\"; filename=\"mother.jpg\"\r\n")
            append("Content-Type: image/jpeg\r\n\r\n")
            
            body.append(motherData)
            append("\r\n")
        }
        
        if let jsonData = try? JSONSerialization.data(
            withJSONObject: requestData.toJSON(),
            options: []
        ) {
            
            append("--\(boundary)\r\n")
            append("Content-Disposition: form-data; name=\"request_data\"\r\n\r\n")
            
            body.append(jsonData)
            append("\r\n")
        }
        
        //http body
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let data = data else { return }
            
            do {
                
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let result = SuccessResponse(JSON: json) {
                    
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                }
                
            } catch {
                
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    func fetchPhotos(completion: @escaping (Result<[NewsResponseModel], Error>) -> Void) {
        
        let url = newsDataBaseURL
        
        AF.request(url, method: .get)
            .responseArray { (response: AFDataResponse<[NewsResponseModel]>) in
                
                switch response.result {
                    
                case .success(let data):
                    completion(.success(data))
                    
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
}
