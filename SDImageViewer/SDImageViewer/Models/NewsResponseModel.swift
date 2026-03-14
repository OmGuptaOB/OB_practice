//
//  NewsResponseModel.swift
//  SDImageViewer
//
//  Created by OBMac-13 on 13/03/26.
//

import Foundation
import ObjectMapper

class NewsResponseModel : Mappable{
    var id: String?
      var author: String?
      var download_url: String?

      required init?(map: Map) {}

      func mapping(map: Map) {
          id <- map["id"]
          author <- map["author"]
          download_url <- map["download_url"]
      }
}
