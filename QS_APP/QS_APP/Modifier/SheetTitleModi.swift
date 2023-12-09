//
//  SheetTitleModi.swift
//  QS_APP
//
//  Created by Tom Salih on 09.12.23.
//

import SwiftUI

struct SheetTitleModi: ViewModifier {
    func body(content: Content) ->  some View {
        content
            .font(.custom(FontStrings.appFontBlack, size: 22))
            .foregroundColor(Color(.appBlue))
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension View{
    func sheetTitleModi() -> some View {
        modifier(SheetTitleModi())
    }
}
