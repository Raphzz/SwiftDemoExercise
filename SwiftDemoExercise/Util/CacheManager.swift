//
//  CacheHelper.swift
//  SwiftDemoExercise
//
//  Created by Raphael Pedrini Velasqua on 05/12/2019.
//  Copyright © 2019 raph. All rights reserved.
//

import Foundation

struct CacheManager {

    private let userDefaults = UserDefaults.standard

    private let encoder = JSONEncoder()

    private let decoder = JSONDecoder()

    func save<T: Codable>(_ value: [T], key: String? = nil) {
        if let data = try? encoder.encode(value) {
            let jsonString = NSString(string: String(data: data, encoding: .utf8)!)
            userDefaults.set(jsonString, forKey: key ?? String(describing: [T].self))
        }
    }

    func save<T: Codable>(_ value: T, key: String? = nil) {
        if let data = try? encoder.encode(value) {
            let jsonString = NSString(string: String(data: data, encoding: .utf8)!)
            userDefaults.set(jsonString, forKey: key ?? String(describing: T.self))
        }
    }

    func get<T: Codable>(_ value: [T], key: String? = nil) -> [T]? {
        if let cachedString = userDefaults.string(forKey: key ?? String(describing: [T].self)) {
            return try? decoder.decode([T].self, from: cachedString.data(using: .utf8)!)
        } else {
            return nil
        }
    }

    func get<T: Codable>(_ value: T.Type, key: String? = nil) -> T? {
        if let cachedString = userDefaults.string(forKey: key ?? String(describing: T.self)) {
            return try? decoder.decode(value, from: cachedString.data(using: .utf8)!)
        } else {
            return nil
        }
    }
}
