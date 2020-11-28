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
    @Published var abilitiesStore = [PKMAbility]()
    @Published var movesStore = [PKMMove]()
    
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
//        MARK: - Delete comments and hardcoded lines to get ALL pokemons -> Once database is implented due extensive loading time
//        for id in 0 ..< limit {
        for id in 0 ..< 50 {
            pokeAPI.pokemonService.fetchPokemon(id){ result in
                switch result {
                case .success(let pokemon):
                    self.pokemonStore.append(pokemon)
                    self.progressValue += (1 / 49)
//                    self.progressValue += (1 / Float(self.limit))
                    print(self.progressValue)
                case .failure(let error):
                    print(error.localizedDescription)
                    self.progressValue += (1 / 49)
//                    self.progressValue += (1 / Float(self.limit))
                    print(self.progressValue)
                }
            }
        }
    }
    
    func getAbilities(resource: [PKMPokemonAbility]) {
        abilitiesStore.removeAll()
        
        for ability in resource {
            pokeAPI.resourceService.fetch(ability.ability!) { result in
                switch result {
                case .success(let ability):
                    self.abilitiesStore.append(ability)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getMoves(resource: [PKMPokemonMove]) {
        movesStore.removeAll()
        print(resource.count)
        for move in resource {
            pokeAPI.resourceService.fetch(move.move!) { result in
                switch result {
                case .success(let move):
                    self.movesStore.append(move)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
