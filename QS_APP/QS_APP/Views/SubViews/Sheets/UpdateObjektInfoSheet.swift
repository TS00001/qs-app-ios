//
//  UpdateObjektInfoSheet.swift
//  QS_APP
//
//  Created by Tom Salih on 14.12.23.
//

import SwiftUI

struct UpdateObjektInfoSheet: View {
    
    @EnvironmentObject var objektVM: ObjektViewModel
    
    var body: some View {
        ScrollView{
            TextField("Objektname", text: $objektVM.objekt.name)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
                .padding(.top, Values.middlePadding)
            
            TextField("Straße", text: $objektVM.objekt.adress.street)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
                .padding(.top, Values.middlePadding)
            
            TextField("Hausnummer", text: $objektVM.objekt.adress.housenumber)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            TextField("Postleitzahl", text: $objektVM.objekt.adress.postalCode)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            TextField("Stadt", text: $objektVM.objekt.adress.city)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            TextField("Mail", text: $objektVM.objekt.mail)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            TextField("Kontaktperson", text: Binding(
                get: {self.objektVM.objekt.contactPerson ?? ""},
                set: {
                    self.objektVM.objekt.contactPerson = $0
                }
            ))
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            TextField("Objektleiter", text: Binding(
                get: {self.objektVM.objekt.objectManager ?? ""},
                set: {
                    self.objektVM.objekt.objectManager = $0
                }
            ))
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            TextField("Reinigungskraft", text: Binding(
                get: {self.objektVM.objekt.cleaningPerson ?? ""},
                set: {
                    self.objektVM.objekt.cleaningPerson = $0
                }
            ))
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            HStack(spacing: 40){
                StandardButton(label: "Abbrechen", color: .appRed, fontColor: .appBackground, action: objektVM.cancelObjekt)
                
                StandardButton(label: "Speichern", color: .appBackground, fontColor: .appBlue, action: saveObjekt)
            }
            .padding(.top, Values.middlePadding)
            .padding(Values.middlePadding)
        }
        .background(Color.appBlue)
    }
    
    
    func saveObjekt(){
        
        let objekt = Objekt(name: objektVM.objekt.name, adress: Adress(street: objektVM.objekt.adress.street, housenumber: objektVM.objekt.adress.housenumber, postalCode: objektVM.objekt.adress.postalCode, city: objektVM.objekt.adress.city), mail: objektVM.objekt.mail, contactPerson: objektVM.objekt.contactPerson, cleaningPerson: objektVM.objekt.cleaningPerson, objectManager: objektVM.objekt.objectManager)
        
        objektVM.updateObjektInformations(with: self.objektVM.objekt.id ?? "", data: objekt)
        objektVM.cancelObjekt()
    }
    
    
}

#Preview {
    UpdateObjektInfoSheet()
}
