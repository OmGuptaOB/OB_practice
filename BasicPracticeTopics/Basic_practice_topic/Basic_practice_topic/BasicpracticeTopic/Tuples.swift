//
//  Tuples.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 13/01/26.
//

import Foundation

class Tuples {
    let results: (passed: Set<Int>, failed: Set<Int?>) = (
        passed: [101, 102],
        failed: [nil]
    )
    
    func tupleof(){
        print(results.passed.contains(101))
    }
    
}
