//
//  AddObjektSheet.swift
//  QS_APP
//
//  Created by Tom Salih on 26.11.23.
//

import SwiftUI

struct AddObjektSheet: View {
    
    @StateObject private var apiVM = AddressAPIViewModel()
    
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
    
    @State var searchText = ""
    
    let listOfServices = [Area]()
    let qualityAssurance = [QualityAssurance]()
    
    
    var body: some View {
        
        TextField("Adresse", text: $searchText)
            .onChange(of: searchText){
                if searchText.count > 2 {
                    apiVM.getAddress(enteredAddress: searchText)
                    for result in apiVM.address.results{
                        print(result.formatted ?? "")
                        print(result.country ?? "")
                    }
//                    print(searchText)
//                    print("Result: \(apiVM.address.results.first?.country ?? "")")
                }
            }
            .padding(20)
            .background(.appRed)
        ZStack{
            AppBackground(color: .appBlue)
    
            
            ScrollView{
                
                
                
//                TextField("Objektname", text: $name)
//                    .formItemStyle(with: .appBlue)
//                
//                TextField("Straße/Nummer", text: $street)
//                    .formItemStyle(with: .appBlue)
//                
//                TextField("Postleitzahl", text: $postalCode)
//                    .formItemStyle(with: .appBlue)
//                    .textContentType(.oneTimeCode)
//                    .keyboardType(.numberPad)
//                
//                TextField("Stadt", text: $city)
//                    .formItemStyle(with: .appBlue)
//                
//                TextField("Mail", text: $mail)
//                    .formItemStyle(with: .appBlue)
//                
//                TextField("Ansprechpartner", text: $contactPerson)
//                    .formItemStyle(with: .appBlue)
//                
//                TextField("Objektleiter", text: $objectManager)
//                    .formItemStyle(with: .appBlue)
//                
//                TextField("Reinigungskraft", text: $cleaningPerson)
//                    .formItemStyle(with: .appBlue)
//                
//                HStack(spacing: 40){
//                    StandardButton(label: "Abbrechen", color: .appRed, fontColor: .appBackground, action: saveObjekt)
//                    
//                    StandardButton(label: "Speichern", color: .appBackground, fontColor: .appBlue, action: saveObjekt)
//                }
//                .padding(.top, Values.middlePadding)
                
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
