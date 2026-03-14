//
//  UserRequest.swift
//  SDImageViewer
//
//  Created by OBMac-13 on 09/03/26.
//

import ObjectMapper

class PostRequest: Mappable {

    var title: String?
    var body: String?
    var userId: Int?
    var id: Int?

    required init?(map: Map) {}

    init(title: String, body: String, userId: Int, id: Int?) {
        self.title = title
        self.body = body
        self.userId = userId
        self.id   = id
    }

    func mapping(map: Map) {
        title  <- map["title"]
        body   <- map["body"]
        userId <- map["userId"]
        id     <- map["id"]
    }
}
