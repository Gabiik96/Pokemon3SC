//
//  StatBarView.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 28/11/2020.
//

import SwiftUI
import PokemonAPI

struct StatBarView: View {
    
    var color: Color = Color.black
    var height: CGFloat = 255
    var width: CGFloat = 15
    var fill: CGFloat = 0
    var statName: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(statName)
                .fontWeight(.black)
                .shadow(radius: 1)
                .foregroundColor(color)
                

            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(Color.white)
                    .opacity(0.5)
                    .frame(width: (width * (UIScreen.main.bounds.size.width / 250)),
                           height: (255 * (UIScreen.main.bounds.size.height / 1300)))
                Rectangle()
                    .fill(color)
                    .frame(width: (width * (UIScreen.main.bounds.size.width / 250)), height: (((height / 100) * fill) * (UIScreen.main.bounds.size.height / 1300)))
            }.padding(.bottom, 5)
        }
        .padding(.leading, 5)
        .padding(.trailing, 5)
        .background(Rectangle()
                        .fill(Color.clear)
                        .opacity(0.5)
                        .overlay(RoundedRectangle(cornerRadius: 2)
                                    .fill(Color.black)
                                    .opacity(0.3)
                                    .frame(width: (width * (UIScreen.main.bounds.size.width / 190)))))
    }
    
}
