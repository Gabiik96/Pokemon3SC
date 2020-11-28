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
    @State var query = ""

    
    private let layout = [GridItem(.adaptive(minimum: 150))]
    @State var gridLayout: [GridItem] = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                BackgroundView()
                VStack {
                    title
                    HStack {
                        searchBar
                        Spacer()
                        ShineButton(toggle: $isShiny, height: 30)
                        layoutBtn
                    }.frame(width: UIScreen.main.bounds.size.width - 20)
                    scrollingBody
                }
                .navigationBarHidden(true)
            }
        }
    }
    
    private var title: some View {
        StrokeText(text: "LEARN ALL ABOUT YOUR \nFAVOURITE POKEMON", width: 2, color: .pokemonBlue)
            .foregroundColor(.pokemonYellow)
            .font(.PokemonSolid(size: 30))
            .padding(.top, 20)
    }
    
    private var searchBar: some View {
        SearchBarView(text: $query)
            .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
    }
    
    private var layoutBtn: some View {
        Button(action: {
            self.gridLayout = Array(repeating: .init(.flexible()), count: self.gridLayout.count % 3 + 1)
        }){
            Image(systemName: "square.grid.2x2")
                .resizable()
                .shadow(color: .pokemonBlue, radius: 1.5)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(self.isShiny ? .pokemonYellow : .pokemonBlue)
                .frame(width: 30, height: 50)
        }
    }
    
    private var scrollingBody: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: gridLayout) {
                ForEach((api.pokemonStore.filter({ query.isEmpty ? true : $0.name!.contains(query.lowercased()) })), id: \.id) { pokemon in
                    NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                        PokemonCell(name: pokemon.name!,
                                    sprite: pokemon.sprites!,
                                    color: pokemon.backgroundColor,
                                    isShiny: self.isShiny,
                                    isFemale: self.isFemale)
                    }.buttonStyle(PlainButtonStyle())
                }
            }.animation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 0.5))
        }.frame(width: UIScreen.main.bounds.size.width - 20)
    }
    
}
