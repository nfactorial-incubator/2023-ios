//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by ablai erzhanov on 09.06.2023.
//

import SwiftUI
import UIKit


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    
    return true
  }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("hello i ma in background")
    }
}

@main
struct ChatAppApp: App {
    
    // MARK: - Delegate from UIKit -
    @UIApplicationDelegateAdaptor var delegate: AppDelegate
    
    // MARK: - Scene Phase -
    @Environment(\.scenePhase)var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
