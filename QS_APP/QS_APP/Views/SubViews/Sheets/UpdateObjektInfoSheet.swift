//
//  UpdateObjektInfoSheet.swift
//  QS_APP
//
//  Created by Tom Salih on 14.12.23.
//

import SwiftUI

struct UpdateObjektInfoSheet: View {
    
    @EnvironmentObject var objektVM: ObjektViewModel
    
    @Binding var objekt: Objekt
    
    var body: some View {
        ScrollView{
            TextField("Objektname", text: $objekt.name)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
                .padding(.top, Values.middlePadding)
            
            TextField("Straße", text: $objekt.adress.street)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
                .padding(.top, Values.middlePadding)
            
            TextField("Hausnummer", text: $objekt.adress.housenumber)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            TextField("Postleitzahl", text: $objekt.adress.postalCode)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            TextField("Stadt", text: $objekt.adress.city)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            TextField("Mail", text: $objekt.mail)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            TextField("Kontaktperson", text: Binding(
                get: {self.objekt.contactPerson ?? ""},
                set: {
                    self.objekt.contactPerson = $0
                }
            ))
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            TextField("Objektleiter", text: Binding(
                get: {self.objekt.objectManager ?? ""},
                set: {
                    self.objekt.objectManager = $0
                }
            ))
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            TextField("Reinigungskraft", text: Binding(
                get: {self.objekt.cleaningPerson ?? ""},
                set: {
                    self.objekt.cleaningPerson = $0
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
        
        let objekt = Objekt(name: objekt.name, adress: Adress(street: objekt.adress.street, housenumber: objekt.adress.housenumber, postalCode: objekt.adress.postalCode, city: objekt.adress.city, lon: objekt.adress.lon, lat: objekt.adress.lat), mail: objekt.mail, contactPerson: objekt.contactPerson, cleaningPerson: objekt.cleaningPerson, objectManager: objekt.objectManager)
        
        objektVM.updateObjektInformations(with: self.objekt.id ?? "", data: objekt)
        objektVM.cancelObjekt()
    }
    
    
}

#Preview {
    UpdateObjektInfoSheet(objekt: .constant(Objekt(name: "", adress: Adress(street: "", housenumber: "", postalCode: "", city: ""), mail: "")))
}
