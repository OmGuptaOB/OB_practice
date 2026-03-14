//
//  File.swift
//  SDImageViewer
//
//  Created by OBMac-13 on 11/03/26.
//

import Foundation
import ObjectMapper

class QuoteRequest : Mappable{
    var user_input: String?
    var platform: String?
    var device_uuid: String?
    
    required init?(map: Map) {}
    
    init(user_input: String?, platform: String, device_uuid: String) {
        self.user_input = user_input
        self.platform = platform
        self.device_uuid = device_uuid
    }

    func mapping(map: Map) {
        user_input <- map["user_input"]
        platform <- map["platform"]
        device_uuid <- map["device_uuid"]
    }
    
   
    
}
