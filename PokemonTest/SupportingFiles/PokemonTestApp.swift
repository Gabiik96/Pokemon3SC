//
//  PokemonTestApp.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 26/11/2020.
//

import SwiftUI

@main
struct PokemonTestApp: App {
    
    @ObservedObject var api = APICustom()
    
    var body: some Scene {
        WindowGroup {
//            if api.progressValue < 1 {
//                LoadingView()
//                    .environmentObject(api)
//                    .onAppear() {
//                        api.getLimit()
//                    }
//            } else {
                ContentView()
                    .environmentObject(api)
                    .onAppear() {
                        api.getLimit()
                    }
            }
//        }
    }
    
}
