//
//  Font.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 27/11/2020.
//

import SwiftUI

extension Font {
    public static func PokemonHollow(size: CGFloat) -> Font {
        return Font.custom("PokemonHollow", size: size)
    }
    
    public static func PokemonSolid(size: CGFloat) -> Font {
        return Font.custom("PokemonSolid", size: size)
    }
}

struct TitleFont: ViewModifier {
    let size: CGFloat
    
    func body(content: Content) -> some View {
        return content.font(.PokemonHollow(size: size))
    }
}

extension View {
    func titleFont(size: CGFloat) -> some View {
        return ModifiedContent(content: self, modifier: TitleFont(size: size))
    }
    
    func titleStyle() -> some View {
        return ModifiedContent(content: self, modifier: TitleFont(size: 16))
    }
}
