//
//  PKMPokemonType.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 28/11/2020.
//

import SwiftUI
import PokemonAPI

extension PKMPokemonType: Hashable {
    
    public static func == (lhs: PKMPokemonType, rhs: PKMPokemonType) -> Bool {
        return lhs.slot == rhs.slot
        
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(slot)
    }
    
}

extension PKMAbility: Hashable {
    
    public static func == (lhs: PKMAbility, rhs: PKMAbility) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
