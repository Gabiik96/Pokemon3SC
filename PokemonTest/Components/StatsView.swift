//
//  StatsView.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 28/11/2020.
//

import SwiftUI
import PokemonAPI

struct StatsView: View {
    
    let statsResource: [PKMPokemonStat]
    
    var body: some View {
            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    if let hpStat = statsResource.first(where: { $0.stat!.name!.contains("hp") }) {
                        StatBarView(color: Color.red, width: 20, fill: CGFloat(hpStat.baseStat!), statName: "HP")
                    }
                    if let attackStat = statsResource.first(where: { $0.stat!.name!.contains("attack") }) {
                        StatBarView(color: Color.orange, height: 170, width: 20, fill: CGFloat(attackStat.baseStat!), statName: "ATT")
                    }
                    if let defenseStat = statsResource.first(where: { $0.stat!.name!.contains("defense") }) {
                        StatBarView(color: Color.yellow, height: 230, width: 20, fill: CGFloat(defenseStat.baseStat!), statName: "DEF")
                    }
                    if let specialATTStat = statsResource.first(where: { $0.stat!.name!.contains("special-attack") }) {
                        StatBarView(color: Color.blue, height: 154, width: 20, fill: CGFloat(specialATTStat.baseStat!), statName: "*ATT")
                    }
                    if let specialDEFStat = statsResource.first(where: { $0.stat!.name!.contains("special-defense") }) {
                        StatBarView(color: Color.green, height: 230, width: 20, fill: CGFloat(specialDEFStat.baseStat!), statName: "*DEF")
                    }
                    if let speedStat = statsResource.first(where: { $0.stat!.name!.contains("speed") }) {
                        StatBarView(color: Color.pink, height: 160, width: 20, fill: CGFloat(speedStat.baseStat!), statName: "SPE")
                    }
            }
            Spacer()
        }
    }
    
}
