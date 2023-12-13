//
//  AddressResultModi.swift
//  QS_APP
//
//  Created by Tom Salih on 12.12.23.
//

import SwiftUI

struct AddressResultModi: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            
            .frame(maxWidth: .infinity, alignment: .leading)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 20)
            .font(.custom(FontStrings.appFontMedium, size: 14))
            
    }
}

extension View {
    func addressResultModi(with: Color) -> some View {
        modifier(AddressResultModi())
    }
}
