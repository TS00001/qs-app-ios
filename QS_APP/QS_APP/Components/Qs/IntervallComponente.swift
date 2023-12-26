//
//  IntervallComponente.swift
//  QS_APP
//
//  Created by Tom Salih on 06.12.23.
//

import SwiftUI

struct IntervallComponente: View {
    
    //TODO: Hier muss das Binding Implementiert werden und in der ObjektDetailView das State
    @Binding var selectedOption: Int?
    @Binding var objekt: Objekt
//    @State var isEditable: Bool

    
    var body: some View {
        
        HStack(spacing: 60) {
            VStack {
                Button(action: {
                    self.selectedOption = 1
                    objekt.interval = self.selectedOption
                }) {
                    VStack{
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .foregroundColor(.appBackground)
                        
                        Text("1 W")
                            .font(.custom(FontStrings.appFontBlack, size: 25))
                            .foregroundColor(.appBackground)
                    }
                }
                .opacity(selectedOption == 1 ? 1 : 0.5)
            }
            
            VStack {
                Button(action: {
                    self.selectedOption = 2
                    objekt.interval = self.selectedOption
                }) {
                    VStack{
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .foregroundColor(.appBackground)
                        
                        Text("2 W")
                            .font(.custom(FontStrings.appFontBlack, size: 25))
                            .foregroundColor(.appBackground)
                    }
                    
                }
                .opacity(selectedOption == 2 ? 1 : 0.5)
            }
            
            VStack {
                Button(action: {
                    self.selectedOption = 3
                    objekt.interval = self.selectedOption
                }) {
                    VStack{
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .foregroundColor(.appBackground)
                        
                        Text("4 W")
                            .font(.custom(FontStrings.appFontBlack, size: 25))
                            .foregroundColor(.appBackground)
                    }
                }
                .opacity(selectedOption == 3 ? 1 : 0.5)
            }
        }
        .padding(.vertical, 30)
        .frame(maxWidth: .infinity)
        .background(.appBlue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: Values.minorShadow)
    }
}

//#Preview {
//    IntervallComponente(selectedOption: .constant(1), objekt: Objekt(name: "", adress: Adress(street: "", housenumber: "", postalCode: "", city: ""), mail: ""), isEditable: false)
//}
