//
//  UpdateCleaningDaysSheet.swift
//  QS_APP
//
//  Created by Tom Salih on 07.12.23.
//

import SwiftUI

struct UpdateCleaningDaysSheet: View {
    @Binding var objektId: String
    
    @EnvironmentObject var objektVM: ObjektViewModel
    
    //MARK: VARIABLES
    
    @Binding var showUpdateCleaningdaysSheet: Bool
    
    @State var cleaningDayMon = false
    @State var cleaningDayTue = false
    @State var cleaningDayWed = false
    @State var cleaningDayThu = false
    @State var cleaningDayFri = false
    
    
    
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
                cleaningDayMon: $cleaningDayMon,
                cleaningDayTue: $cleaningDayTue,
                cleaningDayWed: $cleaningDayWed,
                cleaningDayThu: $cleaningDayThu,
                cleaningDayFri: $cleaningDayFri
            )
            
            StandardButton(label: "SPEICHERN", color: .appBlue, fontColor: .appBackground){
                updateCleaningDays()
                showUpdateCleaningdaysSheet = false
            }
        }
        .vstackModi()
    }
    
    func updateCleaningDays(){
        
        let data = ["cleaningDayMon": cleaningDayMon, "cleaningDayTue": cleaningDayTue, "cleaningDayWed": cleaningDayWed, "cleaningDayThu": cleaningDayThu, "cleaningDayFri": cleaningDayFri]
        
        objektVM.updateCleaningDays(with: objektId, data: data)
    }
}

#Preview {
    UpdateCleaningDaysSheet(objektId: .constant(""), showUpdateCleaningdaysSheet: .constant(false))
}
