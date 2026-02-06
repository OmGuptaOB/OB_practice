//
//  MathService.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 29/01/26.
//
public class MathService {

    public init() {}

    // PUBLIC → accessible from app
    public func add(_ a: Int, _ b: Int) -> Int {
        log("add called")
        return a + b
    }

    // INTERNAL → framework only
    func multiply(_ a: Int, _ b: Int) -> Int {
        return a * b
    }

    // PRIVATE → this type only
    private func log(_ message: String) {
        print("LOG:", message)
    }
}
