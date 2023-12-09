//
//  UpdateCleaningDaysSheet.swift
//  QS_APP
//
//  Created by Tom Salih on 07.12.23.
//

import SwiftUI

struct UpdateCleaningDaysSheet: View {
    
    //MARK: VARIABLES
    
    @Binding var showUpdateCleaningdaysSheet: Bool
    
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
            
//            Spacer()

            CheckmarkComponente()
            
            StandardButton(label: "SPEICHERN", color: .appBlue, fontColor: .appBackground){
                showUpdateCleaningdaysSheet = false
            }
        }
        .vstackModi()
    }
}

#Preview {
    UpdateCleaningDaysSheet(showUpdateCleaningdaysSheet: .constant(false))
}
