//
//  Move.swift
//  Mindshift
//
//  Created by Carlos Yanez Puig on 20/06/2026.
//

import Foundation

enum Move: String, CaseIterable {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
    
    static func random() -> Move {
        allCases.randomElement() ?? .rock
    }
}
