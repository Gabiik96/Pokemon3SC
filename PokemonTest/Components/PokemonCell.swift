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
    var spriteIsShiny: Bool
    let sprite: PKMPokemonSprites
    
    var body: some View {
        
        VStack {
            ImageView(withURL: (self.spriteIsShiny ? self.sprite.frontShiny : self.sprite.frontDefault)!)
            
            StrokeText(text: name, width: 2, color: .blue)
                .foregroundColor(.yellow)
                .font(.PokemonSolid(size: 20))
            
        }.frame(minWidth: 100, maxWidth: 500, minHeight: 150, maxHeight: 750, alignment: .center)
    }
    
}

