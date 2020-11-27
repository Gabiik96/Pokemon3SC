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
