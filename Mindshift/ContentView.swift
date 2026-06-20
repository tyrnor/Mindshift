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
    
    var body: some View {
        VStack {
            Text("My move is \(move.rawValue) and")
            if shouldWin {
                Text("you have to win")
            } else {
                Text("you have to lose")
            }
            Text("Which move should you pick?")
            Button("Rock") {
                checkAnswer(currentMove: move, shouldWin: shouldWin, clickedMove: Move.rock)
            }
            Button("Scissors") {
                checkAnswer(currentMove: move, shouldWin: shouldWin, clickedMove: Move.scissors)
            }
            Button("Paper") {
                checkAnswer(currentMove: move, shouldWin: shouldWin, clickedMove: Move.paper)
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

func checkAnswer(currentMove: Move, shouldWin: Bool, clickedMove: Move) {
    let winningMove = getWinningMove(currentMove, shouldWin)
    if clickedMove == winningMove {
        print("Correct!")
    } else {
        print("Wrong!")
    }
}

#Preview {
    ContentView()
}
