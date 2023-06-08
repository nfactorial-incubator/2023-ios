//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by ablai erzhanov on 20.04.2023.
//

import SwiftUI
// All of the business logic is here

enum Player {
    case human
    case computer
}

struct Move {
    let boardIndex: Int
    let player: Player

    var indicator: String {
        switch player {
        case .human:
            return  "xmark"
        case .computer:
            return "circle"
        }
    }
}

final class GameViewModel: ObservableObject {

    let columns: [GridItem] = [ GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())]

    @Published var moves: [Move?] = Array(repeating: nil, count: 9)
    @Published var isGameDisabled: Bool = false
    @Published var alertItem: AlertItem?


    public func resetGame() {
        moves = Array(repeating: nil, count: 9)
    }

    public func handlePlayerMove(for position: Int) {
        if isCircleOccupied(in: moves, forIndex: position) { return }
        moves[position] = Move(boardIndex: position, player: .human)

        checkGameStatus(player: .human)

        isGameDisabled = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            let computerPosition = determineComputerPosition(in: moves)

            if isCircleOccupied(in: moves, forIndex: computerPosition) { return }
            moves[computerPosition] = Move(boardIndex: computerPosition, player: .computer)

            checkGameStatus(player: .computer)

            isGameDisabled = false
        }

    }

    private func checkGameStatus(player: Player) {
        if checkDrawState(moves: moves) {
            alertItem = AlertContext.draw
            return
        }

        switch player {
        case .human:
            if checkWinState(for: .human, moves: moves) {
                alertItem = AlertContext.humanWin
                return
            }
        case .computer:
            if checkWinState(for: .computer, moves: moves) {
                alertItem = AlertContext.computerWin
                return
            }
        }
    }


    private func isCircleOccupied(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: {$0?.boardIndex == index})
    }


    private func determineComputerPosition(in moves: [Move?]) -> Int {
        let winPatterns: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

        // if AI can win, then win
        if let computerWinMove = blockOrWinPlayer(winPatterns: winPatterns, player: .computer) { return computerWinMove }

        // if AI can't win, then block
        if let computerBlockMove = blockOrWinPlayer(winPatterns: winPatterns, player: .human) { return computerBlockMove }

        // if AI can't even block, let's take middle
        let center = 4
        if !isCircleOccupied(in: moves, forIndex: center) { return center }

        // if if AI can't even take middle, let's take any random position
        var randomIndex = Int.random(in: 0..<9)

        while isCircleOccupied(in: moves, forIndex: randomIndex) {
            randomIndex = Int.random(in: 0..<9)
        }

        return randomIndex
    }

    private func blockOrWinPlayer(winPatterns: Set<Set<Int>>, player: Player) -> Int? {
        let playerMoves = moves.compactMap{$0}.filter{$0.player == player}
        let playerPositions = Set(playerMoves.map {$0.boardIndex})

        for pattern in winPatterns {
            let winPositions = pattern.subtracting(playerPositions)

            if winPositions.count == 1 {
                let isAvailable = !isCircleOccupied(in: moves, forIndex: winPositions.first!)
                if isAvailable { return winPositions.first! }
            }
        }
        return nil
    }


    private func checkWinState(for player: Player, moves: [Move?]) -> Bool {
        let winPatterns: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

        let playerMoves = moves.compactMap{$0}.filter{$0.player == player}
        let playerPositions = Set(playerMoves.map {$0.boardIndex})

        for pattern in winPatterns where pattern.isSubset(of: playerPositions) { return true }

        return false
    }

    private func checkDrawState(moves: [Move?]) -> Bool {
        return moves.compactMap { $0 }.count == 9
    }
}
