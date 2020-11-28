//
//  pokeButton.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 28/11/2020.
//

import SwiftUI

struct ShineButton: View {
    
    @Binding var toggle: Bool
    var paddingTrailing: CGFloat = 5
    var width: CGFloat = 50
    var height: CGFloat = 50
    
    var body: some View {
        Button(action: {
            toggle.toggle()
        }){
            Image(systemName: self.toggle ? "sun.max.fill" : "sun.max")
                .resizable()
                .shadow(color: .pokemonBlue, radius: 3)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(self.toggle ? .pokemonYellow : .pokemonBlue)
                .frame(width: width, height: height)
                .padding(.trailing, paddingTrailing)
        }
    }
}
