//
//  PokemonCell.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 27/11/2020.
//

import SwiftUI
import PokemonAPI

struct PokemonCell: View {
    
    let name: String
    let sprite: PKMPokemonSprites
    let color: Color
    
    var isShiny: Bool
    var isFemale: Bool
    
    var body: some View {
        ZStack {
            CellBackground()
                .fill(RadialGradient(gradient: Gradient(colors: [.white, color]), center: .center, startRadius: 1, endRadius: 100))
                .cornerRadius(15)
                .frame(width: 180, height: 250)
            
            VStack {
                ImageView(withURL: ( self.isShiny ? (self.isFemale ? self.sprite.frontShinyFemale : self.sprite.frontShiny)!
                                : (self.isFemale ? self.sprite.frontFemale : self.sprite.frontDefault)! ))
                    .shadow(color: .black, radius: 5)
                
                Text(name.uppercased())
                    .foregroundColor(.white)
                    .shadow(color: .pokemonBlue, radius: 1)
                    .font(.WalkwayBlack(size: 20))
                
            }.frame(minWidth: 100, maxWidth: 500, minHeight: 150, maxHeight: 750, alignment: .center)
        }
    }
    
}
