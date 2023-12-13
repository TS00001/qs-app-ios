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
    @State var housenumber = ""
    @State var postalCode = ""
    @State var city = ""
    @State var lon = 0.0
    @State var lat = 0.0
    @State var mail = ""
    @State var contactPerson = ""
    @State var objectManager = ""
    @State var cleaningPerson = ""
    
    
    @State var searchText = ""
    
    let listOfServices = [Area]()
    let qualityAssurance = [QualityAssurance]()
    
    
    var body: some View {
        
        VStack{
            ScrollView{
                
                TextField("Objektname", text: $name)
                    .formItemStyle(with: .appBlue)
                    .font(.custom(FontStrings.appFontMedium, size: 16))
                    .padding(.horizontal, Values.middlePadding)
                
                if street == "" {
                    TextField("Addresse", text: $searchText)
                        .onChange(of: searchText){
                            if searchText.count > 2 {
                                apiVM.getAddress(enteredAddress: searchText)
                            }
                        }
                        .formItemStyle(with: .appBlue)
                        .padding(.horizontal, Values.middlePadding)
                } else {
                    HStack{
                        Image(systemName: Values.objektIcon)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(Color.appBlue)
                        VStack{
                            Text("\(street) \(housenumber)")
                                .font(.custom(FontStrings.appFontMedium, size: 16))
                                .foregroundStyle(Color.appBlue)
                            
                            Text("\(postalCode) \(city)")
                                .font(.custom(FontStrings.appFontMedium, size: 16))
                                .foregroundStyle(Color.appBlue)
                        }
                    }
                    .formItemStyle(with: .appBlue)
                    .padding(.horizontal, Values.middlePadding)
                    
                }
                
                
                ZStack{
                    
                    VStack{
                        
                        TextField("Mail", text: $mail)
                            .formItemStyle(with: .appBlue)
                            .padding(.horizontal, Values.middlePadding)
                        TextField("Ansprechpartner", text: $contactPerson)
                            .formItemStyle(with: .appBlue)
                            .padding(.horizontal, Values.middlePadding)
                        TextField("Objektleiter", text: $objectManager)
                            .formItemStyle(with: .appBlue)
                            .padding(.horizontal, Values.middlePadding)
                        TextField("Reinigungskraft", text: $cleaningPerson)
                            .formItemStyle(with: .appBlue)
                            .padding(.horizontal, Values.middlePadding)
                        
                        HStack(spacing: 40){
                            StandardButton(label: "Abbrechen", color: .appRed, fontColor: .appBackground, action: saveObjekt)
                            
                            StandardButton(label: "Speichern", color: .appBackground, fontColor: .appBlue, action: saveObjekt)
                        }
                        .padding(.top, Values.middlePadding)
                        .padding(Values.middlePadding)
                    }
                    
                    if searchText.count > 2 {
                        List{
                            ForEach(apiVM.address.results, id: \.place_id) { result in
                                HStack{
                                    Image(systemName: Values.objektIcon)
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.appBlue)
                                    
                                    Text(result.formatted ?? "")
                                        .font(.custom(FontStrings.appFontBold, size: 18))
                                        .foregroundStyle(Color.appBlue)
                                        .onTapGesture {
                                            searchText = ""
                                            self.street = result.street ?? ""
                                            self.housenumber = result.housenumber ?? ""
                                            self.postalCode = result.postcode ?? ""
                                            self.city = result.city ?? ""
                                            self.lon = result.lon ?? 0.0
                                            self.lat = result.lat ?? 0.0
                                        }
                                }
                            }
                            .listRowBackground(Color.appBackground)
                        }
                        .padding(.top, -35)
                        .background(.opacity(0.0))
                        .scrollContentBackground(.hidden)
                    }
                }
                .backgroundStyle(Color.green)
            }
        }
        .padding(.top, Values.middlePadding)
        .background(Color.appBlue)
    }
    
    func saveObjekt(){
        
        let adress = Adress(street: self.street, housenumber: "", postalCode: self.postalCode, city: self.city, lon: self.lon, lat: self.lat)
        
        let objekt = Objekt(name: self.name, adress: adress, mail: self.mail, contactPerson: self.contactPerson, cleaningPerson: self.cleaningPerson, objectManager: self.objectManager, interval: Interval.one.intervalString, listOfServices: self.listOfServices, qualityAssurance: self.qualityAssurance)
        
        addObjektVM.createObjekt(objekt: objekt)
        
        showAddObjektSheet = false
    }
    
}


#Preview {
    AddObjektSheet(showAddObjektSheet: .constant(false))
}
