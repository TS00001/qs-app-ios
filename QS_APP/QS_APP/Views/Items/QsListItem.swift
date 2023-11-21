//
//  QsListItem.swift
//  QS_APP
//
//  Created by Tom Salih on 21.11.23.
//

import SwiftUI

struct QsListItem: View {
    var body: some View {
        
        HStack{
            Image(systemName: "list.star")
                .resizable()
                .frame(width: 40,height: 40)
                .padding(.vertical, 20)
                .foregroundColor(.appBackground)
            
            VStack {
                HStack {
                    
                        Text("Bäckerei Gauker")
                            .foregroundStyle(Color.appBackground)
                            .font(.custom(FontStrings.appFontBold, size: 22))
                            .bold()
                            .padding(.leading)
                    Spacer()
                }
                HStack{
                    Text("Eugenstraße 37, 72072 Tübingen")
                                .foregroundStyle(Color.appBackground)
                                .font(.footnote)
                                .bold()
                                .padding(.leading)
                    Spacer()
                } }
            Image(systemName: "chevron.right")
                .font(.title)
                .bold()
                .foregroundColor(.appBackground)
        }
        
        
        
        
    }
}

#Preview {
    QsListItem()
}
