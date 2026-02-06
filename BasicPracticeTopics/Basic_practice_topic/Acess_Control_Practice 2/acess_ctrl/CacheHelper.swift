//
//  CacheHelper.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 29/01/26.
//

import Foundation
func testFilePrivate() {
    let manager = UserManager()

    // manager.clearCache() ❌ ERROR
    // because fileprivate works only in SAME FILE
}
