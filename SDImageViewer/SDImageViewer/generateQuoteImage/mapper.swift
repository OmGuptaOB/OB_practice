//
//  mapper.swift
//  SDImageViewer
//
//  Created by OBMac-13 on 12/03/26.
//

import Foundation
import ObjectMapper

class Mapper : Mappable{

    
    var code: Int?
    var data : [DataMapper]?
    var error: String?
    
    required init?(map: Map) {}
    
    func mapping(map: ObjectMapper.Map){
        
        code <- map["code"]
        error <- map["error"]
    }
}

    
class DataMapper : Mappable{
    
    var img_url: String?
    var height: Int?
    var width: Int?
    
    
    required init?(map: Map) {}
    func mapping(map: Map) {
        img_url <- map["img_url"]
        height <- map["height"]
        width <- map["width"]
    }
    
}



    
    
