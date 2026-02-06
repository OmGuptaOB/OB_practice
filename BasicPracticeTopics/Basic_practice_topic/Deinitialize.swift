//
//  Deinitialize.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 08/01/26.
//

import Foundation

class Deinitialize{
    
    class FileLogger {

        let fileName: String

        init(fileName: String) {
            self.fileName = fileName
            print("FileLogger initialized for \(fileName)")
        }

        deinit {
            print("FileLogger deinitialized for \(fileName)")
        }
        
        
    }

}
