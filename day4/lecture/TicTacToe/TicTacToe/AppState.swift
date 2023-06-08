//
//  AppState.swift
//  TicTacToe
//
//  Created by ablai erzhanov on 08.06.2023.
//

import SwiftUI

class AppState {
    var state: AppPhase = .none
    
    static let sharted = AppState()
    
    private init() {}
    
    
    enum AppPhase {
        case active
        case inactive
        case background
        case none
    }
}
