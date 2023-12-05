//
//  ItemTitleModi.swift
//  QS_APP
//
//  Created by Tom Salih on 01.12.23.
//

import SwiftUI

struct ItemTitleModi: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, Values.middlePadding)
            .padding(.bottom, 2)
            .foregroundStyle(Color.appBackground)
            .font(.custom(FontStrings.appFontBlack, size: 16))
            .bold()
            .opacity(0.5)
    }
}

extension View {
    func itemTitleModi() -> some View {
        modifier(ItemTitleModi())
    }
}
