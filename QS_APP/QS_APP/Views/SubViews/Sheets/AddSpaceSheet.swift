//
//  AddSpaceSheet.swift
//  QS_APP
//
//  Created by Tom Salih on 26.12.23.
//

import SwiftUI

struct AddSpaceSheet: View {
    
    @EnvironmentObject var objektVM: ObjektViewModel
    
    var areaID: String
    
    @State var title = ""
    @State var space = ""
    @State var rating = 0
    @State var comment = ""
    @State var cleaningDayMon = false
    @State var cleaningDayTue = false
    @State var cleaningDayWed = false
    @State var cleaningDayThu = false
    @State var cleaningDayFri = false
    
    var body: some View {
            VStack(spacing: 0){
                
                VStack{
                    
                    Text("Füge einen neuen Raum hinzu!")
                        .font(.custom(FontStrings.appFontBlack, size: 22))
                        .foregroundColor(Color(.appBlue))
//                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal, Values.middlePadding)
                        .padding(.top, 50)
                    
                    TextField("Raumbezeichnung", text: $title)
                        .formItemStyle(with: .appBlue)
                        .shadow(radius: Values.minorShadow)
                        .padding(.horizontal, Values.middlePadding)
                        .padding(.top, Values.middlePadding)
                }
                
                Spacer()
                
                StandardButton(label: "Speichern", color: .appBlue, fontColor: .appBackground){
                    objektVM.showAddSpaceSheet = false
                    createSpace()
                }
                .padding(.horizontal, Values.middlePadding)
            }
    }
    
    func createSpace(){
        let space = Space(areaID: self.areaID, title: self.title, comment: self.comment)
        objektVM.createSpace(space: space)

        print(space.areaID)
    }
}


#Preview {
    AddSpaceSheet(areaID: "")
}
