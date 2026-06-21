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
    @State private var gamesLeft = 10
    @State private var showAlert = false
    
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
                Text("🪨 Rock")
            }
            .disabled(hasResponded)
            Button() {
                answerSelected(.scissors)
            } label : {
                Text("✂️ Scissors")
            }
            .disabled(hasResponded)
            Button() {
                answerSelected(.paper)
            } label : {
                Text("📃 Paper")
            }
            .disabled(hasResponded)
            if hasResponded {
                if result {
                    Text("Correct!")
                } else {
                    Text("Wrong!")
                }
                Button() {
                    gamesLeft -= 1
                    if gamesLeft == 0 {
                        showAlert.toggle()
                    } else {
                        move = Move.random()
                        shouldWin.toggle()
                        hasResponded.toggle()
                    }
                } label: {
                    Text("Next")
                }
            }
        }
        .alert("Final score", isPresented: $showAlert) {
            Button("Reset game") {
                move = Move.random()
                shouldWin.toggle()
                hasResponded = false
                score = 0
                gamesLeft = 10
            }
            
        } message: {
            Text("Your final score is \(score)")
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
        } else {
            if score > 0 {
                score -= 1
            }
        }
        hasResponded.toggle()
    }
}



#Preview {
    ContentView()
}
