//
//  SettingsUserProfilCard.swift
//  QS_APP
//
//  Created by Tom Salih on 22.11.23.
//

import SwiftUI

struct SettingsUserProfilCard: View {
    
    //MARK: Variables
    let name: String
    let position: String
    let profilImage: String
    
    var body: some View {
        HStack {
            Image(profilImage)
                .resizable()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .frame(width: 100, height: 100)
                .foregroundColor(Color.appBackground)
            .padding(.leading, 16)
            .padding(.vertical, 20)
            .shadow(radius: 1)
            
            VStack {
                HStack {
                    Text(name)
                        .font(.custom(FontStrings.appFontExtraBold, size: 32))
                        .foregroundColor(.appBackground)
                    .padding(.leading, 20)
                    Spacer()
                }
                
                HStack {
                    Text(position)
                        .font(.custom(FontStrings.appFontRegular, size: 18))
                        .foregroundColor(.appBackground)
                    .padding(.leading, 20)
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
        .padding(16)
        .cornerRadius(10)
    }
}

#Preview {
    SettingsUserProfilCard(name: "Tom Salih", position: "Qualitätssicherung", profilImage: "profilImage")
}
