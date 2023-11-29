//
//  SettingsListItem.swift
//  QS_APP
//
//  Created by Tom Salih on 22.11.23.
//

import SwiftUI

struct SettingsListItem: View {
    
    var icon: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title)
                .bold()
                .foregroundColor(.appBackground)
                .padding(.leading, 16)
                .padding(.vertical, 16)
            
            VStack {
                
                HStack {
                    Text(title)
                        .font(.custom(FontStrings.appFontMedium, size: 18))
                        .foregroundColor(.appBackground)
                    .padding(.leading, 8)
                    Spacer()
                }
            }
            
            Image(systemName: "chevron.right")
                .font(.title2)
                .bold()
                .foregroundColor(.appBackground)
                .padding(.trailing, 16)
            Spacer()
        }
        .background(Color.appBlue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 16)
        .padding(.bottom, 8)
        .cornerRadius(10)
    }
}

#Preview {
    SettingsListItem(icon: "shield", title: "Datenschutz")
}
