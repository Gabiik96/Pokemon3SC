//
//  MovesView.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 29/11/2020.
//

import SwiftUI
import PokemonAPI

struct MovesView: View {
    
    let moves: [PKMMove]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(moves, id: \.self) { move in
                    Text(move.name?.uppercased() ?? "Unknown")
                        .bold()
                        .padding(.top, 5)
                    if move.accuracy != nil { Text("Accuracy: \(move.accuracy!)") }
                    if move.effectChance != nil { Text("Chance: \(move.effectChance!)") }
                    if move.pp != nil { Text("Power points: \(move.pp!)") }
                    if move.power != nil { Text("Base power: \(move.power!)") }
                    Text(move.shortDescription)
                }
            }.padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
    }
}
