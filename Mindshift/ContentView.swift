//
//  ContentView.swift
//  Mindshift
//
//  Created by Carlos Yanez Puig on 20/06/2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shouldWin = false
    
    var body: some View {
        VStack {
            if shouldWin {
                Text("You have to win")
            } else {
                Text("You have to lose")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
