//
//  LogoutButton.swift
//  QS_APP
//
//  Created by Tom Salih on 27.11.23.
//

import SwiftUI

struct LogoutButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action){
            Image(systemName: "power.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.trailing, 15)
                .foregroundColor(.appRed)
        }
    }
}

#Preview {
    LogoutButton() { }
}
