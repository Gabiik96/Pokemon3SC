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
                            basicDetails
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
    
    private var basicDetails: some View {
        VStack(alignment: .leading) {
            Text("Basics")
                .bold()
                .foregroundColor(.pokemonBlue)
            Group {
                Text("Height: ")
                    + Text((String(pokemon.height! * 10))).bold()
                    + Text(" cm")
                Text("Weight: ")
                    + Text((String(pokemon.weight!))).bold()
                    + Text(" kg")
                Text("Experience: ")
                    + Text((String(pokemon.baseExperience!))).bold()
                Text("Default: ")
                    + Text(pokemon.isDefault ?? false ? "Yes" : "No").bold()
                HStack(alignment: .top) {
                    Text("Types: ")
                    VStack(alignment: .leading) {
                        ForEach(0 ..< pokemon.types!.count, id: \.self) { index in
                            Text(String(pokemon.types![index].type!.name ?? "unknown").capitalizingFirstLetter()).bold()
                        }
                    }.padding(.leading, -5)
                }
            }.font(.system(size: 14))
        }.padding(.leading, 25)
        
    }
    
}
