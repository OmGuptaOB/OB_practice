//
//  BabyRequestData.swift
//  SDImageViewer
//
//  Created by OBMac-13 on 11/03/26.
//

import ObjectMapper

class BabyRequestData: Mappable {

    var gender: String?
    var aspect_ratio: String?
    var device_uuid: String?
    var platform: String?

    init(gender: String, aspect_ratio: String = "1:1", device_uuid: String, platform: String) {
        self.gender = gender
        self.aspect_ratio = aspect_ratio
        self.device_uuid = device_uuid
        self.platform = platform
    }

    required init?(map: Map) {}

    func mapping(map: Map) {
        gender       <- map["gender"]
        aspect_ratio <- map["aspect_ratio"]
        device_uuid  <- map["device_uuid"]
        platform     <- map["platform"]
    }
}
