//
//  UpdateCleaningDaysSheet.swift
//  QS_APP
//
//  Created by Tom Salih on 07.12.23.
//

import SwiftUI

struct UpdateCleaningDaysSheet: View {
    
    //MARK: VIEWMODELS
    
    @EnvironmentObject var objektVM: ObjektViewModel
    
    //MARK: VARIABLES
    
    @Binding var objekt: Objekt
    @Binding var showUpdateCleaningdaysSheet: Bool
    @State var cleaningDayMon: Bool = false
    @State var cleaningDayTue: Bool = false
    @State var cleaningDayWed: Bool = false
    @State var cleaningDayThu: Bool = false
    @State var cleaningDayFri: Bool = false
    
    var body: some View {
        
        VStack(spacing: 30){
            HStack(spacing:0){
                Text("WÄHLE DIE REINIGUNGSTAGE AUS")
                    .sheetTitleModi()
                
                Button(action: {
                    showUpdateCleaningdaysSheet = false
                }, label: {
                    Image(systemName: "x.square.fill")
                        .resizable()
                        .frame(width: 22, height: 22, alignment: .topLeading)
                        .frame(alignment: .top)
                        .foregroundStyle(Color.appRed)
                })
            }
            
            CheckmarkComponente(
                objekt: $objekt, isEditable: true
            )
            
            StandardButton(label: "SPEICHERN", color: .appBlue, fontColor: .appBackground){
                updateCleaningDays()
                showUpdateCleaningdaysSheet = false
            }
        }
        .vstackModi()
    }
    
    func updateCleaningDays(){
        let data = ["cleaningDayMon": objekt.cleaningDayMon, "cleaningDayTue": objekt.cleaningDayTue, "cleaningDayWed": objekt.cleaningDayWed, "cleaningDayThu": objekt.cleaningDayThu, "cleaningDayFri": objekt.cleaningDayFri]
        
        objektVM.updateCleaningDays(with: objekt.id ?? "", data: data)
    }
}

#Preview {
    UpdateCleaningDaysSheet(objekt: .constant (Objekt(name: "", adress: Adress(street: "", housenumber: "", postalCode: "", city: ""), mail: "")), showUpdateCleaningdaysSheet: .constant(false)).environmentObject(ObjektViewModel())
}
