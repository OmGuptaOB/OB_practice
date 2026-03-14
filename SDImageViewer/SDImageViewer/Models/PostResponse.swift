//
//  UserResponse.swift
//  SDImageViewer
//
//  Created by OBMac-13 on 09/03/26.
//

import ObjectMapper

class PostResponse: Mappable {

    var id: Int?
    var title: String?
    var body: String?
    var userId: Int?

    required init?(map: Map) {}

    func mapping(map: Map) {
        id     <- map["id"]
        title  <- map["title"]
        body   <- map["body"]
        userId <- map["userId"]
    }
}
