//
//  PokemonDetailView.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 27/11/2020.
//

import SwiftUI
import PokemonAPI

struct PokemonDetailView: View {
    @EnvironmentObject var api: APICustom
    
    let pokemon: PKMPokemon
    var categories = ["Abilities", "Stats", "Moves"]
    
    @State var pickerSelected = 0
    @State var isShiny = false
    
    @State var abilities = [PKMAbility]()
    @State var moves = [PKMMove]()
    
    
    var body: some View {
        NavigationView {
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
                                ShineButton(toggle: $isShiny, paddingTrailing: 25)
                            }
                        }
                    }.frame(height: UIScreen.main.bounds.size.height / 3)
                    pokemonName
                    Spacer ()
                    VStack {
                        pickerBar
                        Spacer()
                        
                        if pickerSelected == 0 {
                            AbilitiesView(abilities: self.abilities)
                        } else if pickerSelected == 1 {
                            StatsView(statsResource: pokemon.stats!)
                        } else if pickerSelected == 2 {
                            MovesView(moves: self.moves)
                        }
                    }
                    
                    
                }
            }.onAppear() {
                api.getAbilities(resource: self.pokemon.abilities!)
                api.getMoves(resource: self.pokemon.moves!)
                // Delay to have result ready
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.abilities = api.abilitiesStore
                    self.moves = api.movesStore
                }
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
                            Text(String(pokemon.types![index].type!.name?.capitalized ?? "unknown")).bold()
                        }
                    }.padding(.leading, -5)
                }
            }.font(.system(size: 14))
        }.padding(.leading, 25)
    }
    
    private var pickerBar: some View {
        Picker(selection: $pickerSelected.animation(), label: Text("")) {
            ForEach(0 ..< categories.count) {
                Text(self.categories[$0])
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.init(top: 10, leading: 10, bottom: 0, trailing: 10))
    }
    
}
