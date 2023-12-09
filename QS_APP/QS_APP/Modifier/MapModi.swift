//
//  MapModi.swift
//  QS_APP
//
//  Created by Tom Salih on 09.12.23.
//

import SwiftUI

struct MapModi: ViewModifier {
    func body(content : Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(maxWidth: .infinity)
            .frame(height: 150)
            .padding(.vertical, 30)
            .shadow(radius: Values.minorShadow)
    }
}

extension View{
    func mapModi() -> some View {
        modifier(MapModi())
    }
}
