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
    @State var isShiny = false
    @State var isFemale = false
    
    private let layout = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack(alignment: .center) {
                    
                    StrokeText(text: "LEARN ALL ABOUT YOUR \nFAVOURITE POKEMON", width: 2, color: .blue)
                        .foregroundColor(.yellow)
                        .font(.PokemonSolid(size: 25))
                    
                    
                }.padding(.top, 20)
                
                
                Button(action: {
                    isShiny.toggle()
                }){
                    Image(systemName: "rectangle")
                }
                ScrollView {
                    LazyVGrid(columns: layout) {
                        ForEach(api.pokemonStore, id: \.id) { pokemon in
                            NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                PokemonCell(name: pokemon.name!,
                                            sprite: pokemon.sprites!,
                                            color: pokemon.backgroundColor,
                                            isShiny: self.isShiny,
                                            isFemale: self.isFemale)
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
