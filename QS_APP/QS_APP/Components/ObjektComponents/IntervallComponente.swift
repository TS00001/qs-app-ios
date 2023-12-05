//
//  IntervallComponente.swift
//  QS_APP
//
//  Created by Tom Salih on 06.12.23.
//

import SwiftUI

struct IntervallComponente: View {
    
    var body: some View {
        HStack(spacing: 60){
            VStack{
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .foregroundColor(.appBackground)
                
                Text("1 W")
                    .font(.custom(FontStrings.appFontBlack, size: 25))
                    .foregroundColor(.appBackground)
            }
            
            
            
            VStack{
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .foregroundColor(.appBackground)
                
                Text("2 W")
                    .font(.custom(FontStrings.appFontBlack, size: 25))
                    .foregroundColor(.appBackground)
            }
            .opacity(0.5)
            
            
            
            VStack{
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .foregroundColor(.appBackground)
                
                Text("4 W")
                    .font(.custom(FontStrings.appFontBlack, size: 25))
                    .foregroundColor(.appBackground)
            }
            .opacity(0.5)
        }
        .padding(.vertical, 30)
        .frame(maxWidth: .infinity)
        .background(.appBlue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: Values.minorShadow)
    }
}

#Preview {
    IntervallComponente()
}
