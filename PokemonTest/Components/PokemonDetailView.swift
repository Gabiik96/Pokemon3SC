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
            Rectangle()
                .fill(pokemon.backgroundColor)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color.white)
                        .opacity(0.5)
                        .padding()
                    ZStack {
                        VStack(alignment: .center) {
                            ImageView(withURL: (self.isShiny ? self.pokemon.sprites?.frontShiny : self.pokemon.sprites?.frontDefault)!)
                                    .frame(width: 400, height: 180)
                            ImageView(withURL: (self.isShiny ? self.pokemon.sprites?.backShiny : self.pokemon.sprites?.backDefault)!)
                                .frame(width: 400, height: 180)
                        }
                        HStack {
                            Spacer()
                            VStack(alignment: .trailing) {
                                Spacer()
                                Button(action: {
                                    isShiny.toggle()
                                }){
                                    Image(systemName: self.isShiny ? "sun.max.fill" : "sun.max")
                                        .resizable()
                                        .shadow(color: .pokemonBlue, radius: 1.5)
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(self.isShiny ? .pokemonYellow : .pokemonBlue)
                                        .frame(width: 50, height: 50)
                                }
                                Spacer()
                                Spacer()
                            }.padding(.trailing, 25)
                        }
                    }
                    
                }.frame(height: 300)
                
                StrokeText(text: pokemon.name!.uppercased(), width: 4, color: .pokemonBlue)
                    .foregroundColor(.yellow)
                    .padding(.top)
                    .font(.PokemonSolid(size: 50))
                
                Spacer ()
                
            }
        }
        
    }
}
