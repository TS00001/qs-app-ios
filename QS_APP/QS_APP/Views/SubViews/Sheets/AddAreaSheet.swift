//
//  AddAreaSheet.swift
//  QS_APP
//
//  Created by Tom Salih on 26.12.23.
//

import SwiftUI

struct AddAreaSheet: View {
    
    @EnvironmentObject var objektVM: ObjektViewModel
    
    var objektID: String
    
    var body: some View {
        
        VStack(spacing: 0){
            
            VStack{
                
                Text("Füge einen neuen Bereich hinzu!")
                    .font(.custom(FontStrings.appFontBlack, size: 22))
                    .foregroundColor(Color(.appBlue))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 40)
                    .padding(.top, 50)
                
                TextField("Bereichsbezeichnung", text: $objektVM.areaTitle)
                    .formItemStyle(with: .appBlue)
                    .shadow(radius: Values.minorShadow)
                    .padding(.horizontal, Values.middlePadding)
                    .padding(.top, Values.middlePadding)
            }
            
            Spacer()
            
            StandardButton(label: "Speichern", color: .appBlue, fontColor: .appBackground){
                createArea()
                objektVM.areaTitle = ""
                objektVM.showAddAreaSheet = false
            }
            .padding(.horizontal, Values.middlePadding)
            
        }
        .padding(.bottom, 60)
        .padding(.top, Values.middlePadding)
        .background(Color.appBackground)
    }
    
    func createArea(){
        let area = Area(objektID: self.objektID, title: self.objektVM.areaTitle)
        objektVM.createArea(area: area)
    }
}

#Preview {
    AddAreaSheet(objektID: "")
}
