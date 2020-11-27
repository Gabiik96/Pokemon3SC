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
    
    @Published var progressValue: Float = 0
    @Published var isLoading = true
    let pokeAPI = PokemonAPI()
    
    
    var limit = 0
    
    func getLimit(){
        self.pokeAPI.pokemonService.fetchPokemonList(){ result in
            switch result {
            case .success(let result):
                
                self.limit = result.count!
                self.getPokemons()
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getPokemons() {
        for id in 0 ..< limit {
            pokeAPI.pokemonService.fetchPokemon(id){ result in
                switch result {
                case .success(let pokemon):
                    self.pokemonStore.append(pokemon)
                    self.progressValue += (1 / Float(self.limit))
                    print(self.progressValue)
                case .failure(let error):
                    print(error.localizedDescription)
                    self.progressValue += (1 / Float(self.limit))
                    print(self.progressValue)
                }
            }
        }
    }
    
}
