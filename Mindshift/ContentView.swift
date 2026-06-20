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
            Text("\(move.rawValue)")
            if shouldWin {
                Text("You have to win")
            } else {
                Text("You have to lose")
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

#Preview {
    ContentView()
}
