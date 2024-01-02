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
    
    //MARK: VARIABLES
    @Binding var showAddObjektSheet: Bool
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
    @State var adressLine1 = ""
    @State var searchText = ""
    @State private var isEditing = false
    
    let listOfServices = [Area]()
    let qualityAssurance = [QualityAssurance]()
    
    var body: some View {
        
        VStack(spacing: 0){
            ScrollView{
                //SEARCHBAR
                HStack{
                    TextField("Suche eine Adresse", text: $searchText)
                        .padding(.leading, 20)
                        .onTapGesture {
                            self.isEditing = true
                        }
                        .onChange(of: searchText){
                            if searchText.count > 2 {
                                apiVM.getAddress(enteredAddress: searchText)
                            }
                        }
                        .formItemStyle(with: Color.appBlue)
                        .padding(Values.middlePadding)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .bold()
                                    .foregroundColor(.appBlue)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 25)
                                
                                if isEditing {
                                    Button(action: {
                                        self.searchText = ""
                                    }) {
                                        Image(systemName: "multiply.circle.fill")
                                            .bold()
                                            .foregroundColor(.appBlue)
                                            .padding(.trailing, 25)
                                    }
                                }
                            }
                        )
                }
                
                VStack(spacing: 10){
                    TextField("Objektname", text: $name)
                        .formItemStyle(with: .appBlue)
                        .padding(.horizontal, Values.middlePadding)
                    
                    TextField("Straße", text: $adressLine1)
                        .formItemStyle(with: .appBlue)
                        .padding(.horizontal, Values.middlePadding)
                    
                    TextField("Hausnummer", text: $housenumber)
                        .formItemStyle(with: .appBlue)
                        .padding(.horizontal, Values.middlePadding)
                    
                    TextField("Postleitzahl", text: $postalCode)
                        .formItemStyle(with: .appBlue)
                        .padding(.horizontal, Values.middlePadding)
                    
                    TextField("Stadt", text: $city)
                        .formItemStyle(with: .appBlue)
                        .padding(.horizontal, Values.middlePadding)
                    
                    HStack(spacing: 40){
                        StandardButton(label: "Abbrechen", color: .appRed, fontColor: .appBackground, action: cancelObjekt)
                        
                        StandardButton(label: "Speichern", color: .appBackground, fontColor: .appBlue, action: saveObjekt)
                    }
                    .padding(.top, Values.middlePadding)
                    .padding(Values.middlePadding)
                }
                .overlay(VStack{
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
                                            self.adressLine1 = result.address_line1 ?? ""
                                        }
                                }
                            }
                            .listRowBackground(Color.appBackground)
                        }
                        .padding(.top, -35)
                        .padding(.horizontal, -6)
                        .background(.opacity(0.0))
                        .scrollContentBackground(.hidden)
                    }
                })
            }
        }
        .padding(.top, Values.middlePadding)
        .background(Color.appBlue)
    }
    //MARK: FUNKTIONEN
    
    func saveObjekt(){
        
        let adress = Adress(street: self.street, housenumber: self.housenumber, postalCode: self.postalCode, city: self.city, lon: self.lon, lat: self.lat)
        
        let objekt = Objekt(name: self.name, adress: adress, mail: self.mail, contactPerson: self.contactPerson, cleaningPerson: self.cleaningPerson, objectManager: self.objectManager, interval: Interval.one.intervalString, listOfServices: self.listOfServices, qualityAssurance: self.qualityAssurance)
        
        addObjektVM.createObjekt(objekt: objekt)
        
        showAddObjektSheet = false
    }
    
    func cancelObjekt(){
        showAddObjektSheet = false
    }
}

#Preview {
    AddObjektSheet(showAddObjektSheet: .constant(false))
}
