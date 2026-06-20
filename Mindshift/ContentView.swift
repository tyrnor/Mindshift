//
//  ContentView.swift
//  Mindshift
//
//  Created by Carlos Yanez Puig on 20/06/2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shouldWin = false
    @State private var move = getMove()
    @State private var winningMove: Move?
    
    var body: some View {
        VStack {
            Text("\(move.rawValue)")
            if shouldWin {
                Text("You have to win")
            } else {
                Text("You have to lose")
            }
            Button("Rock") {
                winningMove = getWinningMove(move, shouldWin)
                if winningMove == Move.rock {
                    print("You win!")
                }
            }
            Button("Scissors") {
                winningMove = getWinningMove(move, shouldWin)
                if winningMove == Move.scissors {
                    print("You win!")
                }
            }
            Button("Paper") {
                winningMove = getWinningMove(move, shouldWin)
                if winningMove == Move.paper {
                    print("You win!")
                }
            }
        }
        .padding()
    }
}

func getMove() -> Move {
    guard let move = Move.allCases.randomElement() else { return Move.paper
    }
    return move
}

func getWinningMove(_ move: Move, _ shouldWin: Bool) -> Move {
    if shouldWin {
        switch move {
        case .rock: return .paper
        case .paper: return .scissors
        case .scissors: return .rock
        }
    } else {
        switch move {
        case .rock: return .scissors
        case .paper: return .rock
        case .scissors: return .paper
        }
    }
}

#Preview {
    ContentView()
}
