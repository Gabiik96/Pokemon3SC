//
//  PKMPokemon.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 27/11/2020.
//

import SwiftUI
import PokemonAPI

extension PKMPokemon {
    var backgroundColor: Color {
        switch types?.first?.type!.name {
            case "normal":  return Color(0xA8A77A)
            case "fighting":  return Color(0xC22E28)
            case "flying":  return Color(0xA98FF3)
            case "poison":  return Color(0xA33EA1)
            case "ground":  return Color(0xE2BF65)
            case "rock":  return Color(0xB6A136)
            case "bug":  return Color(0xA6B91A)
            case "ghost":  return Color(0x735797)
            case "fire":  return Color(0xEE8130)
            case "water":  return Color(0x6390F0)
            case "grass":  return Color(0x7AC74C)
            case "electric":  return Color(0xF7D02C)
            case "psychic":  return Color(0xF95587)
            case "ice":  return Color(0x96D9D6)
            case "dragon":  return Color(0x6F35FC)
            case "dark":  return Color(0x705746)
            case "fairy":  return Color(0xD685AD)
            case "steel":  return Color(0xB7B7CE)
            default :  return Color.black
        }
    }
}

extension PKMMove {
    var shortDescription: String {
        return effectEntries?.first(where: { $0.language!.name == "en" })?.shortEffect ?? "Unknown description"
    }
}

extension PKMAbility {
    var description: String {
        return effectEntries?.first(where: { $0.language!.name == "en" })?.effect ?? "Unknown description"
    }
}

