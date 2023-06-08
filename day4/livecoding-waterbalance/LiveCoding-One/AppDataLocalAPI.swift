//
//  AppDataLocalAPI.swift
//  LiveCoding-One
//
//  Created by ablai erzhanov on 08.06.2023.
//

import Foundation



struct AppDataAPI {
    @AppDataStorage(key: "isOnboarding", defaultValue: true)
    static var isOnboarding: Bool
    
    
    @AppDataStorage(key: "userGoal", defaultValue: Goals.none)
    static var userGoal: Goals
    
    @AppDataStorage(key: "reminder", defaultValue: Reminders.none)
    static var reminder: Reminders
    
    @AppDataStorage(key: "intakeAmount", defaultValue: 2400)
    static var intakeAmount: Double
    
    @AppDataStorage(key: "progress", defaultValue: 0.0)
    static var progress: Double
    
    @AppDataStorage(key: "intakeHistory", defaultValue: [])
    static var intakeHistory: [HistoryElement]
    
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

