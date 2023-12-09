//
//  ItemSubTitleModi.swift
//  QS_APP
//
//  Created by Tom Salih on 01.12.23.
//

import SwiftUI

struct ItemSubTitleModi: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, Values.middlePadding)
            .foregroundStyle(Color.appBackground)
            .font(.custom(FontStrings.appFontRegular, size: 18))
            .bold()
    }
}

extension View {
    func itemSubtitleModi() -> some View {
        modifier(ItemSubTitleModi())
    }
}
