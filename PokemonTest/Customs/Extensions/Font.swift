//
//  Font.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 27/11/2020.
//

import SwiftUI

extension Font {
    public static func PokemonHollow(size: CGFloat) -> Font {
        return Font.custom("PokemonHollowNormal", size: size)
    }
    
    public static func PokemonSolid(size: CGFloat) -> Font {
        return Font.custom("PokemonSolidNormal", size: size)
    }
    
    public static func WalkwayBlack(size: CGFloat) -> Font {
        return Font.custom("Walkway_Black", size: size)
    }
    
    public static func WalkwayBold(size: CGFloat) -> Font {
        return Font.custom("Walkway_Bold", size: size)
    }
    
    public static func WalkwaySemiBold(size: CGFloat) -> Font {
        return Font.custom("Walkway_SemiBold", size: size)
    }
    
    public static func WalkwayOblique(size: CGFloat) -> Font {
        return Font.custom("Walkway_Oblique", size: size)
    }
    
    public static func WalkwayObliqueBold(size: CGFloat) -> Font {
        return Font.custom("Walkway_Oblique_Bold", size: size)
    }
    
    public static func WalkwayObliqueSemiBold(size: CGFloat) -> Font {
        return Font.custom("Walkway_Oblique_SemiBold", size: size)
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
