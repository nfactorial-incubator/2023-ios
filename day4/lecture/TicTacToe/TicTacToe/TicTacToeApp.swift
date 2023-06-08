//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by ablai erzhanov on 20.04.2023.
//

import SwiftUI

@main
struct TicTacToeApp: App {
    
    
    var body: some Scene {
        WindowGroup {
            createContentView()
        }
    }

    func createContentView() -> ContentView {
        let viewModel = GameViewModel()
        return ContentView(gameViewModel: viewModel)
    }
}
