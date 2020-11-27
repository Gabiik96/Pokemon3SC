//
//  GIFView.swift
//  ThePea
//
//  Created by Gabriel Balta on 24/10/2020.
//

import SwiftUI

struct GIFView: UIViewRepresentable {
    var gifName: String

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<GIFView>) {
    }

    func makeUIView(context: Context) -> UIView {
        return GIFPlayerView(gifName: gifName)
    }
}
