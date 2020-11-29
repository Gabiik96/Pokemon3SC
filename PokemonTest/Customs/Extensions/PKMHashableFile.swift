//
//  PKMPokemonType.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 28/11/2020.
//

import SwiftUI
import PokemonAPI

extension PKMPokemon: Hashable, Identifiable {
    
    public static func == (lhs: PKMPokemon, rhs: PKMPokemon) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.hashValue == rhs.hashValue
        
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

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

extension PKMMove: Hashable {
    
    public static func == (lhs: PKMMove, rhs: PKMMove) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
