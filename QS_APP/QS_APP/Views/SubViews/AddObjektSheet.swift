//
//  AddObjektSheet.swift
//  QS_APP
//
//  Created by Tom Salih on 26.11.23.
//

import SwiftUI

struct AddObjektSheet: View {
    
    //MARK: VARIABLES
    @State var objectName = ""
    @State var street = ""
    @State var postalCode = ""
    @State var city = ""
    @State var mail = ""
    
    @State var contactPerson = ""
    @State var objectManager = ""
    @State var cleaningPerson = ""
    
    
    var body: some View {
        ZStack{
            AppBackground(color: .appBlue)
            
            ScrollView{
                TextField("Objektname", text: $objectName)
                    .formItemStyle(with: .appBlue)
                
                TextField("Straße", text: $street)
                    .formItemStyle(with: .appBlue)
                
                TextField("Mail", text: $mail)
                    .formItemStyle(with: .appBlue)
                
                TextField("Postleitzahl", text: $postalCode)
                    .formItemStyle(with: .appBlue)
                    .textContentType(.oneTimeCode)
                    .keyboardType(.numberPad)
                
                TextField("Stadt", text: $city)
                    .formItemStyle(with: .appBlue)
                
                TextField("Ansprechpartner", text: $contactPerson)
                    .formItemStyle(with: .appBlue)
                
                TextField("Objektleiter", text: $objectManager)
                    .formItemStyle(with: .appBlue)
                
                TextField("Reinigungskraft", text: $cleaningPerson)
                    .formItemStyle(with: .appBlue)
                
                HStack(spacing: 40){
                    StandardButton(label: "Abbrechen", color: .appRed, fontColor: .appBackground, action: saveObjekt)
                    StandardButton(label: "Speichern", color: .appBackground, fontColor: .appBlue, action: saveObjekt)
                }
                .padding(.top, Values.middlePadding)
                
            }
            .padding(.top, Values.majorPadding)
            .padding(Values.middlePadding)
            
        }
        
        
    }
    
    
    func saveObjekt(){
        //TODO: Funkrion die das neue Objekt abspeichert.
    }
    
}


#Preview {
    AddObjektSheet()
}
