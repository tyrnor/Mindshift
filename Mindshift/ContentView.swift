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
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Spacer()
            Text("My move is \(move.rawValue) and")
                .foregroundStyle(.white)
            Text(shouldWin ? "you have to win" : "you have to lose")
                .foregroundStyle(.white)
            Text("Which move should you pick?")
                .foregroundStyle(.white)
                .padding(.bottom, 20)
            Button {
                answerSelected(.rock)
            } label: {
                Text("🪨 Rock")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(hasResponded ? Color.white.opacity(0.1) : Color.white.opacity(0.4))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .disabled(hasResponded)
            Button {
                answerSelected(.scissors)
            } label: {
                Text("✂️ Scissors")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(hasResponded ? Color.white.opacity(0.1) : Color.white.opacity(0.4))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .disabled(hasResponded)
            Button {
                answerSelected(.paper)
            } label: {
                Text("📃 Paper")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(hasResponded ? Color.white.opacity(0.1) : Color.white.opacity(0.4))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .disabled(hasResponded)
            Spacer()
            VStack {
                Text(result ? "Correct!" : "Wrong!")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Button {
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
                .buttonStyle(.borderedProminent)
            }
            .opacity(hasResponded ? 1 : 0)
            .scaleEffect(hasResponded ? 1 : 0.8)
            .animation(.spring(duration: 0.3), value: hasResponded)
            .padding(.bottom, 70)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 30)
        .background(Color(red: 0.12, green: 0.08, blue: 0.18))
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

    func checkAnswer(currentMove: Move, shouldWin: Bool, clickedMove: Move)
        -> Bool
    {
        let winningMove = getWinningMove(currentMove, shouldWin)
        if clickedMove == winningMove {
            return true
        } else {
            return false
        }
    }

    func answerSelected(_ clickedMove: Move) {
        result = checkAnswer(
            currentMove: move,
            shouldWin: shouldWin,
            clickedMove: clickedMove
        )
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
