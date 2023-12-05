//
//  AddObjektSheet.swift
//  QS_APP
//
//  Created by Tom Salih on 26.11.23.
//

import SwiftUI

struct AddObjektSheet: View {
    
    @EnvironmentObject var addObjektVM: ObjektViewModel
    
    @Binding var showAddObjektSheet: Bool
    
    //MARK: VARIABLES
    @State var name = ""
    @State var street = ""
    @State var postalCode = ""
    @State var city = ""
    @State var mail = ""
    @State var contactPerson = ""
    @State var objectManager = ""
    @State var cleaningPerson = ""
    let listOfServices = [Area]()
    let qualityAssurance = [QualityAssurance]()
    
    
    var body: some View {
        ZStack{
            AppBackground(color: .appBlue)
            
            ScrollView{
                TextField("Objektname", text: $name)
                    .formItemStyle(with: .appBlue)
                
                TextField("Straße/Nummer", text: $street)
                    .formItemStyle(with: .appBlue)
                
                TextField("Postleitzahl", text: $postalCode)
                    .formItemStyle(with: .appBlue)
                    .textContentType(.oneTimeCode)
                    .keyboardType(.numberPad)
                
                TextField("Stadt", text: $city)
                    .formItemStyle(with: .appBlue)
                
                TextField("Mail", text: $mail)
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
        
        let adress = Adress(street: self.street, postalCode: self.postalCode, city: self.city)
        
        let objekt = Objekt(name: self.name, adress: adress, mail: self.mail, contactPerson: self.contactPerson, cleaningPerson: self.cleaningPerson, objectManager: self.objectManager, interval: Interval.one.intervalString, listOfServices: self.listOfServices, qualityAssurance: self.qualityAssurance)
        
        addObjektVM.createObjekt(objekt: objekt)
        
        showAddObjektSheet = false
    }
    
}


#Preview {
    AddObjektSheet(showAddObjektSheet: .constant(false))
}
