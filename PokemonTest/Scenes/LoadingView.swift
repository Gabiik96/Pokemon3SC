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
                Spacer()
                GIFView(gifName: "PokeballLoading")
                    .frame(width: 200, height: 200)
                
                ProgressBar(value: self.$api.progressValue)
                    .padding()
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
                Rectangle().frame(width: geometry.size.width , height: 30)
                    .opacity(0.3)
                    .border(Color.yellow, width: 4)
                    .foregroundColor(Color(UIColor.systemTeal))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: 22)
                    .foregroundColor(Color(UIColor.systemBlue))
                    .animation(.linear)
            }
        }
    }
}
