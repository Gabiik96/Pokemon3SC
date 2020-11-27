//
//  LoadingView.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 27/11/2020.
//

import SwiftUI

struct LoadingView: View {
    
    @EnvironmentObject var api: APICustom
    
    var body: some View {
        NavigationView {
            VStack {
                Image("pokeLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 250)
                
                Spacer()
                
                GIFView(gifName: "PokeballLoading")
                    .frame(width: 200, height: 200)
                
                ProgressBar(value: self.$api.progressValue)
                    .frame(height: 30)
                    .padding()
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

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
