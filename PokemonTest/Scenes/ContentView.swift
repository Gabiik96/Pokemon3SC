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
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                BackgroundView()
                VStack {
                    
                    HStack(alignment: .center) {
                        
                        StrokeText(text: "LEARN ALL ABOUT YOUR \nFAVOURITE POKEMON", width: 2, color: .blue)
                            .foregroundColor(.yellow)
                            .font(.PokemonSolid(size: 30))
                        
                        
                    }.padding(.top, 20)
                    
                    
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
                    ScrollView(.vertical) {
                        LazyVGrid(columns: layout) {
                            ForEach(api.pokemonStore, id: \.id) { pokemon in
                                NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                    PokemonCell(name: pokemon.name!,
                                                sprite: pokemon.sprites!,
                                                color: pokemon.backgroundColor,
                                                isShiny: self.isShiny,
                                                isFemale: self.isFemale)
                                        .padding()
                                }.buttonStyle(PlainButtonStyle())
                            }
                        }
                    }.frame(width: UIScreen.main.bounds.size.width - 20)
                }
                .navigationBarHidden(true)
            }
        }
    }
}
