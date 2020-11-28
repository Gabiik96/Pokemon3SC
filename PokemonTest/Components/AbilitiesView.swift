//
//  AbilitiesView.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 28/11/2020.
//

import SwiftUI
import PokemonAPI

struct AbilitiesView: View {
    @EnvironmentObject var api: APICustom
    
    @State private var abilities = [PKMAbility]()
    
    let abilitiesResource: [PKMPokemonAbility]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(abilities, id: \.self) { ability in
                    
                    HStack {
                        Text(ability.name?.uppercased() ?? "Unknown").bold()
                        Image(systemName: "m.circle")
                            .show(isVisible: (ability.isMainSeries ?? false) ? true : false)
                    }
                    .padding(.top, 5)
                    
                    Text(ability.description)
                        
                }
            }.padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
        }.onAppear() {
            api.getAbilities(resource: self.abilitiesResource)
            // Delay to have result ready
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.abilities = api.abilitiesStore
            }
        }
    }
    
}

