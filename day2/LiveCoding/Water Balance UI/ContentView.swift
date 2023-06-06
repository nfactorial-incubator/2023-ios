//
//  ContentView.swift
//  Water Balance UI
//
//  Created by Vasiliy Shannikov on 10.12.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 1
    var body: some View {
        TabView(selection: $selectedTab) {
            Main1()
                .tabItem {
                    Label("Main", systemImage: "house.fill")
                }
                .tag(1)
            
            Settings()
                .tabItem {
                    Label("Settings", systemImage: "slider.vertical.3")
                }
                .tag(2)
            
            History()
                .tabItem {
                    Label("History", systemImage: "doc.fill")
                }
                .tag(3)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
