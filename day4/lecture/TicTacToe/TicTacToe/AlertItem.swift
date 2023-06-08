//
//  AlertItem.swift
//  TicTacToe
//
//  Created by ablai erzhanov on 20.04.2023.
//

import SwiftUI


struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let buttonTitle: Text
}


struct AlertContext {
    static let humanWin = AlertItem(title: Text("You Win"), message: Text("Let's goooo"), buttonTitle: Text("gg"))
    static let computerWin = AlertItem(title: Text("You Lost!("), message: Text("That's tuff loser"), buttonTitle: Text("gg"))
    static let draw = AlertItem(title: Text("Draw!"), message: Text("Challenge"), buttonTitle: Text("gg again?"))
}
