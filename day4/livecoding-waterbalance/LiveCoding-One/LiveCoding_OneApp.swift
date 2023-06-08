//
//  LiveCoding_OneApp.swift
//  LiveCoding-One
//
//  Created by ablai erzhanov on 05.06.2023.
//

import SwiftUI

@main
struct LiveCoding_OneApp: App {
    @ObservedObject var onboardManager: OnboardManager = OnboardManager()
    
    var body: some Scene {
        WindowGroup {
            if onboardManager.isOnboarding {
                ScreenOne()
                    .environmentObject(onboardManager)
            } else {
                MainTabView()
                    .environmentObject(onboardManager)
            }
           
        }
    }
}
