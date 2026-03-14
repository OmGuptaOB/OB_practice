//
//  SucessResponse.swift
//  SDImageViewer
//
//  Created by OBMac-13 on 11/03/26.
//

import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class ErrorResponse: Mappable,Error {

    var code: Int?
    var message: String?
    var cause: String?
    var data: DataURL?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        cause <- map["cause"]
        data <- map["data"]
    }
}

