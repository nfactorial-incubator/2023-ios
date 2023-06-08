//
//  MainTabView.swift
//  nFactorial-LiveCoding-One
//
//  Created by ablai erzhanov on 05.06.2023.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MainScreen()
                .tabItem {
                    Text("Main")
                    Image("home")
                        .renderingMode(.template)
                        .foregroundColor(.blue)
                }
            
            SettingsScreen()
                .tabItem {
                    Text("Settings")
                    Image("settings")
                        .renderingMode(.template)
                        .foregroundColor(.blue)
                }
            
            HistoryScreen()
                .tabItem {
                    Text("History")
                    Image("history")
                        .renderingMode(.template)
                        .foregroundColor(.blue)
                }
        }

    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
