//
//  UpdateIntervallSheet.swift
//  QS_APP
//
//  Created by Tom Salih on 09.12.23.
//

import SwiftUI

struct UpdateIntervallSheet: View {
    
    //MARK: VIEWMODELS
    
    @EnvironmentObject var objektVM: ObjektViewModel
    
    //MARK: VARIABLES
    
    @Binding var objekt: Objekt
    
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
            IntervallComponente(selectedOption: $objekt.interval, objekt: $objekt)
            
            StandardButton(label: "Speichern", color: .appBlue, fontColor: .appBackground){
                updateIntervall()
                showUpdateQsIntervallSheet = false
            }
        }
        .vstackModi()
    }
    
    func updateIntervall(){
        let data = ["interval": objekt.interval]
        objektVM.updateIntervall(with: objekt.id ?? "", data: data as [String : Any])
    }
}

#Preview {
    UpdateIntervallSheet(objekt: .constant (Objekt(name: "", adress: Adress(street: "", housenumber: "", postalCode: "", city: ""), mail: "")), showUpdateQsIntervallSheet: .constant(false))
}
