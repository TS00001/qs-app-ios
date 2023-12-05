//
//  QsOverviewItem.swift
//  QS_APP
//
//  Created by Tom Salih on 27.11.23.
//

import SwiftUI

struct QsOverviewItem: View {

    @State private var rating = 3
    
    var body: some View {
        VStack(spacing: 0){
            
            Text("QS ÜBERSICHT")
                .font(.custom(FontStrings.appFontBlack, size: Values.appTitle))
                .bold()
                .foregroundStyle(Color.appBackground)
                .padding(.vertical, Values.middlePadding)
            
            
            RatingView(rating: $rating)
                .padding(.horizontal, Values.middlePadding)
                .padding(.vertical, Values.middlePadding)
            
            
        }
        .background(Color.appBlue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    QsOverviewItem()
}
