//
//  VstackModi.swift
//  QS_APP
//
//  Created by Tom Salih on 09.12.23.
//

import SwiftUI

struct VstackModi: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, Values.middlePadding)
            .background(.appBackground)
    }
}

extension View {
    func vstackModi() -> some View {
        modifier(VstackModi())
    }
}

