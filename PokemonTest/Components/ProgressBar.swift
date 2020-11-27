//
//  ProgressBar.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 27/11/2020.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .border(Color.pokemonBlue, width: 4)
                    .foregroundColor(Color(UIColor.systemYellow))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height - 8)
                    .foregroundColor(Color.pokemonYellow)
                    .animation(.linear)
            }
        }
    }
}
