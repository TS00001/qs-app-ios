//
//  AddAreaSheet.swift
//  QS_APP
//
//  Created by Tom Salih on 26.12.23.
//

import SwiftUI

struct AddAreaSheet: View {
    
    @EnvironmentObject var objektVM: ObjektViewModel
    
    @Binding var shawAddAreaSheet: Bool
    
    var objektID = ""
    
    @State var title = ""
//    @State var area = ""
    
    var body: some View {
        VStack(spacing: 0){
            
            VStack(spacing: 0){
                
                Button(action: {
                    shawAddAreaSheet = false
                }, label: {
                    Image(systemName: "x.square.fill")
                        .resizable()
                        .frame(width: 22, height: 22, alignment: .topLeading)
                        .frame(alignment: .top)
                        .foregroundStyle(Color.appRed)
                })
                .padding(.horizontal, Values.middlePadding)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.top, 10)
            
            Spacer()
            
            VStack(spacing: 30){
                Text("Füge einen neuen Bereich hinzu!")
                    .font(.custom(FontStrings.appFontBlack, size: 22))
                    .foregroundColor(Color(.appBlue))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, Values.middlePadding)
                
                TextField("Name des Bereiches", text: $title)
                    .formItemStyle(with: .appBlue)
                    .shadow(radius: Values.minorShadow)
                    .padding(.horizontal, Values.middlePadding)
                    .padding(.top, Values.middlePadding)
                
                Spacer()
                
                StandardButton(label: "Speichern", color: .appBlue, fontColor: .appBackground){
                    createArea()
                    shawAddAreaSheet = false
            }
                .padding(.horizontal, Values.middlePadding)
            
            }
            .padding(.bottom, 60)
            
        }
        .padding(.top, Values.middlePadding)
        .background(Color.appBackground)
    }
    
    func createArea(){
        let area = Area(title: self.title)
        let areaDict = ["listOfServices" : [area]]
        objektVM.createArea(with: objektID, data: areaDict)
    }
}

#Preview {
    AddAreaSheet(shawAddAreaSheet: .constant(false))
}
