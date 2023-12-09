//
//  TitleStyle.swift
//  QS_APP
//
//  Created by Tom Salih on 27.11.23.
//

import SwiftUI

struct TitleStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.custom(FontStrings.appFontBlack, size: Values.appTitle))
            .bold()
            .foregroundStyle(Color.appBlue)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(Values.middlePadding)
    }
    
}

extension View {
    func titleStyle() -> some View {
        modifier(TitleStyle())
    }
}
