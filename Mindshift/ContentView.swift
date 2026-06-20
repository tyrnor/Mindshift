//
//  ContentView.swift
//  Mindshift
//
//  Created by Carlos Yanez Puig on 20/06/2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shouldWin = false
    @State private var move = Move.random()
    @State private var hasResponded = false
    @State private var result: Bool = false
    @State private var score = 0
    
    var body: some View {
        VStack {
            Text("Current score: \(score)")
            Text("My move is \(move.rawValue) and")
            if shouldWin {
                Text("you have to win")
            } else {
                Text("you have to lose")
            }
            Text("Which move should you pick?")
            Button() {
                answerSelected(.rock)
            } label : {
                Text("Rock")
            }
            Button() {
                answerSelected(.scissors)
            } label : {
                Text("Scissors")
            }
            Button() {
                answerSelected(.paper)
            } label : {
                Text("Paper")
            }
            if hasResponded {
                if result {
                    Text("Correct!")
                } else {
                    Text("Wrong!")
                }
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

    func checkAnswer(currentMove: Move, shouldWin: Bool, clickedMove: Move) -> Bool{
        let winningMove = getWinningMove(currentMove, shouldWin)
        if clickedMove == winningMove {
            return true
        } else {
            return false
        }
    }
    
    func answerSelected(_ clickedMove: Move) {
        result = checkAnswer(currentMove: move, shouldWin: shouldWin, clickedMove: clickedMove)
        if result {
            score += 1
        }
        hasResponded.toggle()
    }
}



#Preview {
    ContentView()
}
