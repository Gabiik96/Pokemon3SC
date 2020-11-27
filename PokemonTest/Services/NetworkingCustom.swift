//
//  NetworkingService.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 26/11/2020.
//

import Foundation
import PokemonAPI

class APICustom: ObservableObject {
    @Published var pokemonStore = [PKMPokemon]()
    
    var limit: Int = 20

    func getPokemons(limit: Int) {
        for id in 0 ..< limit {
            PokemonAPI().pokemonService.fetchPokemon(id){ result in
            switch result {
            case .success(let pokemon):
                self.pokemonStore.append(pokemon)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        }
    }
}
