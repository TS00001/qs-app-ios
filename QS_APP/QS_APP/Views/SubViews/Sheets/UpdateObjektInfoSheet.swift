//
//  UpdateObjektInfoSheet.swift
//  QS_APP
//
//  Created by Tom Salih on 14.12.23.
//

import SwiftUI

struct UpdateObjektInfoSheet: View {
    
    
    @EnvironmentObject var objektVM: ObjektViewModel
    
    @Binding var showUpdateObjektInformations: Bool
    
    @State var name = ""
    @State var adress = Adress(street: "", housenumber: "", postalCode: "", city: "")
    @State var mail = ""
    @State var contactPerson = ""
    @State var objectManager = ""
    @State var cleaningPerson = ""
    @State var objektId = ""
    
    var body: some View {
        VStack{
            TextField("Objektname", text: self.$name)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
                .padding(.top, Values.middlePadding)
            
            TextField("Straße", text: self.$adress.street)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
                .padding(.top, Values.middlePadding)
            
            TextField("Hausnummer", text: self.$adress.housenumber)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            TextField("Postleitzahl", text: self.$adress.postalCode)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            TextField("Stadt", text: self.$adress.city)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            TextField("Mail", text: self.$mail)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            TextField("Kontaktperson", text: self.$contactPerson)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            TextField("Objektleiter", text: self.$objectManager)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            TextField("Reinigungskraft", text: self.$cleaningPerson)
                .formItemStyle(with: .appBlue)
                .padding(.horizontal, Values.middlePadding)
            
            HStack(spacing: 40){
                StandardButton(label: "Abbrechen", color: .appRed, fontColor: .appBackground, action: cancelObjekt)
                
                StandardButton(label: "Speichern", color: .appBackground, fontColor: .appBlue, action: saveObjekt)
            }
            .padding(.top, Values.middlePadding)
            .padding(Values.middlePadding)
        }
        .background(Color.appBlue)
        .padding(.top, Values.middlePadding)
    }
    
    
    func saveObjekt(){
        
        let objekt = Objekt(name: self.name, adress: Adress(street: self.adress.street, housenumber: self.adress.housenumber, postalCode: self.adress.postalCode, city: self.adress.city), mail: self.mail, contactPerson: self.contactPerson, cleaningPerson: self.cleaningPerson, objectManager: self.objectManager)
        
        objektVM.updateObjektInformations(with: objektId, data: objekt)
        cancelObjekt()
    }
    
    func cancelObjekt(){
        showUpdateObjektInformations = false
    }
}
//
//#Preview {
//    UpdateObjektInfoSheet(name: .constant(""), adress: .constant(Adress(street: "", housenumber: "", postalCode: "", city: "", lon: 0.0, lat: 0.0)), mail: .constant(""), contactPerson: .constant(""), objectManager: .constant(""), cleaningPerson: .constant(""), objektId: .constant(""))
//}
