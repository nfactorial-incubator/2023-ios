//
//  ContentView.swift
//  TicTacToe
//
//  Created by ablai erzhanov on 20.04.2023.
//

import SwiftUI

struct ContentView: View {

    @StateObject var gameViewModel: GameViewModel

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()

                LazyVGrid(columns: gameViewModel.columns, spacing: 10) {
                    ForEach(0..<9, id: \.self) { i in
                        ZStack {
                            GameCircleView(geometry: geometry)
                            PlayerMarkerView(playerMarker: gameViewModel.moves[i]?.indicator)
                        }
                        .onTapGesture {
                            gameViewModel.handlePlayerMove(for: i)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .disabled(gameViewModel.isGameDisabled)
            .alert(item: $gameViewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: {
                    gameViewModel.resetGame()
                }))
            }
        }
        .onAppear {
            print("View is on Appear")
        }
        .onDisappear {
            print("On Dissapear")
        }
    }
}

struct GameCircleView: View {
    var geometry: GeometryProxy

    var body: some View {
        Circle()
            .foregroundColor(.purple)
            .opacity(0.9)
            .frame(width: geometry.size.width / 3 - 25,
                   height: geometry.size.width / 3 - 25)
    }
}

struct PlayerMarkerView: View {
    var playerMarker: String?
    var body: some View {
        Image(systemName: playerMarker ?? "")
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameViewModel: GameViewModel())
    }
}
