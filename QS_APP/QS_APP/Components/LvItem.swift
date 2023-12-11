//
//  LvItem.swift
//  QS_APP
//
//  Created by Tom Salih on 10.12.23.
//

import SwiftUI

struct LvItem: View {
    
    let title: String
    
    var body: some View {
        
        HStack{
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .foregroundStyle(Color.appBackground)
                .font(.custom(FontStrings.appFontRegular, size: 18))
                .bold()
            
            Image(systemName: Values.arrowRight)
                .font(.title)
                .bold()
                .foregroundColor(.appBackground)
                .padding(.trailing, Values.middlePadding)
        }
        .frame(height: 70)
        .background(Color.appBlue )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: Values.minorShadow)
    }
}

#Preview {
    LvItem(title: "Leistungsverzeichnis")
}
