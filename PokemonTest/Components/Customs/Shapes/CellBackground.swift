//
//  CellBackground.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 28/11/2020.
//

import SwiftUI

struct CellBackground: Shape {

    func path(in rect: CGRect) -> Path {

        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY / 2 ))
        path.addCurve(to: CGPoint(x: rect.maxX, y: rect.maxY / 2.5 ),
                      control1: CGPoint(x: rect.minX, y: rect.minY),
                      control2: CGPoint(x: rect.maxX, y: rect.maxY / 4 ))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}
