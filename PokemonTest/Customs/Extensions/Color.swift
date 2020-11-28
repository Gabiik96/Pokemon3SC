//
//  Color.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 27/11/2020.
//

import SwiftUI

extension Color {
    
    init(_ hex: UInt32, opacity:Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
    
    public static var pokemonBlue: Color {
        Color("pokemonBlue", bundle: nil)
    }
    
    public static var pokemonYellow: Color {
        Color("pokemonYellow", bundle: nil)
    }
    
}
