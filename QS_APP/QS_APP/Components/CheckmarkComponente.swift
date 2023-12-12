//
//  CheckmarkComponente.swift
//  QS_APP
//
//  Created by Tom Salih on 05.12.23.
//

import SwiftUI

struct CheckmarkComponente: View {
    @State private var isMOActivated = false
    @State private var isDIActivated = false
    @State private var isMIActivated = false
    @State private var isDOActivated = false
    @State private var isFRkctivated = false
    
    var body: some View {
        HStack(spacing: 20) {
            
            VStack {
                Text("MO")
                    .font(.custom(FontStrings.appFontBlack, size: 30))
                    .padding(.top, 20)
                    .foregroundColor(.appBackground)
                
                Image(systemName: isMOActivated ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .bold()
                    .padding(.vertical, 10)
                    .padding(.bottom, 20)
                    .foregroundColor(.appBackground)
                    .onTapGesture {
                        isMOActivated.toggle()
                    }
            }
            
            VStack {
                Text("DI")
                    .font(.custom(FontStrings.appFontBlack, size: 30))
                    .padding(.top, 20)
                    .foregroundColor(.appBackground)
                
                Image(systemName: isDIActivated ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .bold()
                    .padding(.vertical, 10)
                    .padding(.bottom, 20)
                    .foregroundColor(.appBackground)
                    .onTapGesture {
                        
                        isDIActivated.toggle()
                    }
            }
            
            VStack {
                Text("MI")
                    .font(.custom(FontStrings.appFontBlack, size: 30))
                    .padding(.top, 20)
                    .foregroundColor(.appBackground)
                
                Image(systemName: isMIActivated ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .bold()
                    .padding(.vertical, 10)
                    .padding(.bottom, 20)
                    .foregroundColor(.appBackground)
                    .onTapGesture {
                        
                        isMIActivated.toggle()
                    }
            }
            
            VStack {
                Text("DO")
                    .font(.custom(FontStrings.appFontBlack, size: 30))
                    .padding(.top, 20)
                    .foregroundColor(.appBackground)
                
                Image(systemName: isDOActivated ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .bold()
                    .padding(.vertical, 10)
                    .padding(.bottom, 20)
                    .foregroundColor(.appBackground)
                    .onTapGesture {
                        
                        isDOActivated.toggle()
                    }
            }
            
            VStack {
                Text("FR")
                    .font(.custom(FontStrings.appFontBlack, size: 30))
                    .padding(.top, 20)
                    .foregroundColor(.appBackground)
                
                Image(systemName: isFRkctivated ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .bold()
                    .padding(.vertical, 10)
                    .padding(.bottom, 20)
                    .foregroundColor(.appBackground)
                    .onTapGesture {
                        
                        isFRkctivated.toggle()
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
