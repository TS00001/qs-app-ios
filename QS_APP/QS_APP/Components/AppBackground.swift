//
//  AppBackground.swift
//  QS_APP
//
//  Created by Tom Salih on 26.11.23.
//

import SwiftUI

struct AppBackground: View {
    
    var color: Color
    
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .ignoresSafeArea()
    }
}

#Preview {
    AppBackground(color: .appBackground)
}
