//
//  pokeButton.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 28/11/2020.
//

import SwiftUI

struct ShineButton: View {
    
    @AppStorage("shine") private var isShiny: Bool = false
    var paddingTrailing: CGFloat = 5
    var width: CGFloat = 50
    var height: CGFloat = 50
    
    var body: some View {
        Button(action: {
            isShiny.toggle()
            UserDefaults.standard.set(self.isShiny, forKey: "shine")
        }){
            Image(systemName: self.isShiny ? "sun.max.fill" : "sun.max")
                .resizable()
                .shadow(color: .pokemonBlue, radius: 3)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(self.isShiny ? .pokemonYellow : .pokemonBlue)
                .frame(width: width, height: height)
                .padding(.trailing, paddingTrailing)
        }
    }
}
