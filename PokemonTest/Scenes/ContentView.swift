//
//  ContentView.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 26/11/2020.
//

import SwiftUI
import PokemonAPI

struct ContentView: View {
    
    @EnvironmentObject var api: APICustom
    @State var stripeIsShiny = false
    
    private let layout = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack(alignment: .center) {
                    GIFView(gifName: "PokeballLoading")
                        .frame(width: 50, height: 50)
                    
                    StrokeText(text: "LEARN ALL ABOUT YOUR \nFAVOURITE POKEMON", width: 2, color: .blue)
                        .foregroundColor(.yellow)
                        .font(.PokemonSolid(size: 25))
                    
                    
                    GIFView(gifName: "PokeballLoading")
                        .frame(width: 50, height: 50)
                }.padding(.top, 20)
                
                
                Button(action: {
                    stripeIsShiny.toggle()
                }){
                    Image(systemName: "rectangle")
                }
                ScrollView {
                        LazyVGrid(columns: layout) {
                            ForEach(api.pokemonStore, id: \.id) { pokemon in
                                NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                    PokemonCell(name: pokemon.name!, spriteIsShiny: self.stripeIsShiny, sprite: pokemon.sprites!)
                                }.buttonStyle(PlainButtonStyle())
                            }
                        }.padding()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
