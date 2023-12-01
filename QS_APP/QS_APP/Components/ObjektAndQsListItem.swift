//
//  QsListItem.swift
//  QS_APP
//
//  Created by Tom Salih on 21.11.23.
//

import SwiftUI

struct ObjektAndQsListItem: View {
    
    let icon: String
    let title: String
    let street: String
    let postalCode: String
    let city: String
    
    var body: some View {
        
        HStack{
            Image(systemName: icon)
                .resizable()
                .frame(width: Values.listItemIconFrame, height: Values.listItemIconFrame)
                .padding(.vertical, Values.middlePadding)
                .padding(.horizontal, Values.middlePadding)
                .foregroundColor(.appBackground)
            
            VStack {
                HStack {
                    
                        Text(title)
                            .foregroundStyle(Color.appBackground)
                            .font(.custom(FontStrings.appFontBold, size: Values.appSubtitle))
                            .bold()
                    Spacer()
                }
                HStack{
                    Text("\(street), \(postalCode) \(city)")
                                .foregroundStyle(Color.appBackground)
                                .font(.footnote)
                                .bold()

                    Spacer()
                } }
            Image(systemName: Values.arrowRight)
                .font(.title)
                .bold()
                .foregroundColor(.appBackground)
                .padding(.trailing, Values.middlePadding)
        }
        .background(Color.appBlue )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
        
        
        
    }
}

#Preview {
    ObjektAndQsListItem(icon: Values.qsIcon, title: "Bäckerei Gauker", street: "Eugenstraße 10", postalCode: "72072", city: "Tübingen")
}
