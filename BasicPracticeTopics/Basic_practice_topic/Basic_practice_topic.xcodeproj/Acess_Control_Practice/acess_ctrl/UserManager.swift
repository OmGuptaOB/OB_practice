//
//  UserManager.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 29/01/26.
//

// MARK: - OPEN (framework level)

public class UserManager {

    // PUBLIC property
    internal var appName: String = "CoreKit"

    // INTERNAL property (default)
    var usersCount: Int = 0

    // PRIVATE property
    private var secretKey: String = "123-SECRET"

    // FILEPRIVATE property
    fileprivate var cache: [String] = []

    // PUBLIC initializer (important!)
    public init() {}

    // OPEN method (can be overridden)
    public func login(username: String) {
        validate(username)
        usersCount += 1
        print("\(username) logged in")
    }

    // INTERNAL method
    internal func logout(username: String) {
        print("\(username) logged out")
    }

    // PRIVATE method
    private func validate(_ username: String) {
        print("Validating with \(secretKey)")
    }

    // FILEPRIVATE method
    fileprivate func clearCache() {
        cache.removeAll()
    }
   
}

