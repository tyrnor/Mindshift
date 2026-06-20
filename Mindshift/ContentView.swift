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
    @State private var hasResponded = false
    @State private var result: String = ""
    
    var body: some View {
        VStack {
            Text("My move is \(move.rawValue) and")
            if shouldWin {
                Text("you have to win")
            } else {
                Text("you have to lose")
            }
            Text("Which move should you pick?")
            Button() {
                result = checkAnswer(currentMove: move, shouldWin: shouldWin, clickedMove: Move.rock)
                hasResponded.toggle()
            } label : {
                Text("Rock")
            }
            Button() {
                result = checkAnswer(currentMove: move, shouldWin: shouldWin, clickedMove: Move.scissors)
                hasResponded.toggle()
            } label : {
                Text("Scissors")
            }
            Button() {
                result = checkAnswer(currentMove: move, shouldWin: shouldWin, clickedMove: Move.paper)
                hasResponded.toggle()
            } label : {
                Text("Paper")
            }
            if hasResponded {
                Text(result)
                Button() {
                    move = getMove()
                    shouldWin.toggle()
                    hasResponded.toggle()
                } label: {
                    Text("Next")
                }
            }
        }
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

func checkAnswer(currentMove: Move, shouldWin: Bool, clickedMove: Move) -> String{
    let winningMove = getWinningMove(currentMove, shouldWin)
    if clickedMove == winningMove {
        return "Correct!"
    } else {
        return "Wrong!"
    }
}

#Preview {
    ContentView()
}
