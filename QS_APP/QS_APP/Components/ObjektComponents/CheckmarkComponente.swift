//
//  CheckmarkComponente.swift
//  QS_APP
//
//  Created by Tom Salih on 05.12.23.
//

import SwiftUI

struct CheckmarkComponente: View {
    @State private var isMOkActivated = false
    @State private var isDIkActivated = false
    @State private var isMIkActivated = false
    @State private var isDOkActivated = false
    @State private var isFRkActivated = false
    
    var body: some View {
        HStack(spacing: 20) {
            VStack {
                Text("MO")
                    .font(.custom(FontStrings.appFontBlack, size: 30))
                    .padding(.top, 20)
                    .foregroundColor(.appBackground)
                
                Image(systemName: isMOkActivated ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .bold()
                    .padding(.vertical, 20)
                    .foregroundColor(.appBackground)
                    .onTapGesture {
                        
                        isMOkActivated.toggle()
                    }
            }
            
            VStack {
                Text("DI")
                    .font(.custom(FontStrings.appFontBlack, size: 30))
                    .padding(.top, 20)
                    .foregroundColor(.appBackground)
                
                Image(systemName: isDIkActivated ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .bold()
                    .padding(.vertical, 20)
                    .foregroundColor(.appBackground)
                    .onTapGesture {
                        
                        isDIkActivated.toggle()
                    }
            }
            
            VStack {
                Text("MI")
                    .font(.custom(FontStrings.appFontBlack, size: 30))
                    .padding(.top, 20)
                    .foregroundColor(.appBackground)
                
                Image(systemName: isMIkActivated ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .bold()
                    .padding(.vertical, 20)
                    .foregroundColor(.appBackground)
                    .onTapGesture {
                        
                        isMIkActivated.toggle()
                    }
            }
            
            VStack {
                Text("DO")
                    .font(.custom(FontStrings.appFontBlack, size: 30))
                    .padding(.top, 20)
                    .foregroundColor(.appBackground)
                
                Image(systemName: isDOkActivated ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .bold()
                    .padding(.vertical, 20)
                    .foregroundColor(.appBackground)
                    .onTapGesture {
                        
                        isDOkActivated.toggle()
                    }
            }
            
            VStack {
                Text("FR")
                    .font(.custom(FontStrings.appFontBlack, size: 30))
                    .padding(.top, 20)
                    .foregroundColor(.appBackground)
                
                Image(systemName: isFRkActivated ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .bold()
                    .padding(.vertical, 20)
                    .foregroundColor(.appBackground)
                    .onTapGesture {
                        
                        isFRkActivated.toggle()
                    }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.appBlue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: Values.minorShadow)
    }
}

#Preview {
    CheckmarkComponente()
}
