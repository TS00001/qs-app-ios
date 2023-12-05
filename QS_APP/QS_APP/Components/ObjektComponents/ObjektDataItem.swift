//
//  ObjektDataComponente.swift
//  QS_APP
//
//  Created by Tom Salih on 01.12.23.
//

import SwiftUI

struct ObjektDataItem<Content: View>: View {
    
    //MARK: VARIABLES
    let title: String
//    let content: String
    
    var body: some View {
        HStack(spacing: 0){
            VStack(spacing: 0){
                Text(title)
                    .itemTitleModi()
                content()
            }
            .padding(.leading, Values.middlePadding)
        }
        .background(Color.appBlue )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: Values.minorShadow)
    }
    
    @ViewBuilder var content: () -> Content
}

#Preview {
    ObjektDataItem(title: "Mail") {}
}
