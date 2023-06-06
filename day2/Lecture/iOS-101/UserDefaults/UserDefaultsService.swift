//
//  UserDefaultsService.swift
//  iOS-101
//
//  Created by ablai erzhanov on 06.06.2023.
//

import Foundation

struct User: Codable {
    var name: String
    var surname: String
}


struct AppDataAPI {
    @AppDataStorage(key: "isOnboarding", defaultValue: false)
    static var isOnboarding: Bool
    
    
    @AppDataStorage(key: "isRegistered", defaultValue: false)
    static var isRegistered: Bool
    
    @AppDataStorage(key: "User", defaultValue: User(name: "Beket", surname: "Barlyq"))
    static var user: User
}





@propertyWrapper
struct AppDataStorage<T: Codable> {
    private let key: String
    private let defaultValue: T

    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            guard let data = try? UserDefaults.standard.object(forKey: key) as? Data else {
                return defaultValue
            }
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }

        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}

