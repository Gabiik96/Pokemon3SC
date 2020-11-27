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
            
            Text(name)
            
        }.frame(minWidth: 100, maxWidth: 500, minHeight: 150, maxHeight: 750, alignment: .center)
    }
    
}

