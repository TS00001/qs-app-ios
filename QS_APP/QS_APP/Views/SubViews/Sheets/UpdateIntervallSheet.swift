//
//  UpdateIntervallSheet.swift
//  QS_APP
//
//  Created by Tom Salih on 09.12.23.
//

import SwiftUI

struct UpdateIntervallSheet: View {
    
    //MARK: VARIABLES
    
    @Binding var showUpdateQsIntervallSheet: Bool
    
    var body: some View {
        VStack(spacing: 30){
            
            HStack{
                Text("WÄHLE DEN QS INTERVALL")
                    .sheetTitleModi()
                
                Button(action: {
                    showUpdateQsIntervallSheet = false
                }, label: {
                    Image(systemName: "x.square.fill")
                        .resizable()
                        .frame(width: 22, height: 22, alignment: .topLeading)
                        .frame(alignment: .top)
                        .foregroundStyle(Color.appRed)
                })
            }
            IntervallComponente()
            
            StandardButton(label: "Speichern", color: .appBlue, fontColor: .appBackground){
                showUpdateQsIntervallSheet = false
            }
        }
        .vstackModi()
    }
}

#Preview {
    UpdateIntervallSheet(showUpdateQsIntervallSheet: .constant(false))
}
