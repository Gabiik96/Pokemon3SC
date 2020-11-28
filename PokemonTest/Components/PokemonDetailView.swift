//
//  PokemonDetailView.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 27/11/2020.
//

import SwiftUI
import PokemonAPI

struct PokemonDetailView: View {
    let pokemon: PKMPokemon
    
    @State var isShiny = false
    
    var body: some View {
        ZStack {
            background
            
            VStack {
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color.white)
                        .opacity(0.5)
                        .padding()
                    ZStack {
                        pokemonSprites
                        HStack {
                            Spacer()
                                shineBtn
                        }
                    }
                    
                }.frame(height: 300)
                
                pokemonName
                
                Spacer ()
                
            }
        }
        
    }
    
    private var background: some View {
        Rectangle()
            .fill(pokemon.backgroundColor)
            .edgesIgnoringSafeArea(.all)
    }
    
    private var pokemonSprites: some View {
        VStack(alignment: .center) {
            ImageView(withURL: (self.isShiny ? self.pokemon.sprites?.frontShiny : self.pokemon.sprites?.frontDefault)!)
                    .frame(width: 400, height: 180)
            ImageView(withURL: (self.isShiny ? self.pokemon.sprites?.backShiny : self.pokemon.sprites?.backDefault)!)
                .frame(width: 400, height: 180)
        }
    }
    
    private var shineBtn: some View {
        Button(action: {
            isShiny.toggle()
        }){
            Image(systemName: self.isShiny ? "sun.max.fill" : "sun.max")
                .resizable()
                .shadow(color: .pokemonBlue, radius: 1.5)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(self.isShiny ? .pokemonYellow : .pokemonBlue)
                .frame(width: 50, height: 50)
                .padding(.trailing, 25)
        }
    }
    
    private var pokemonName: some View {
        StrokeText(text: pokemon.name!.uppercased(), width: 4, color: .pokemonBlue)
            .foregroundColor(.yellow)
            .padding(.top)
            .font(.PokemonSolid(size: 50))
    }
}
