//
//  ShowViewModifier.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 28/11/2020.
//

import SwiftUI

struct Show: ViewModifier {
    var isVisible: Bool

    @ViewBuilder
    func body(content: Content) -> some View {
        if isVisible {
            content
        } else {
            content.hidden()
        }
    }
}

extension View {
    func show(isVisible: Bool) -> some View {
        ModifiedContent(content: self, modifier: Show(isVisible: isVisible))
    }
}
