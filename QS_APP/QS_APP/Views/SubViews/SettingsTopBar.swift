//
//  SettingsTopBar.swift
//  QS_APP
//
//  Created by Tom Salih on 22.11.23.
//

import SwiftUI

struct SettingsTopBar: View {
    
    let title: String
    let BtnIcon: String
    let BtnAction: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(Color.appBlue)
                .font(.custom(FontStrings.appFontBlack, size: 35))
                .bold()
                .padding(20)
            Spacer()
            Button(action: BtnAction){
                Image(systemName: BtnIcon)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(.trailing, 15)
                    .foregroundColor(.appRed)
            }
            
        }
    }
}

#Preview {
    SettingsTopBar(title: "EINSTELLUNGEN", BtnIcon: "power.circle.fill"){ }
}
