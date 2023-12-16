//
//  ObjektDetailView.swift
//  QS_APP
//
//  Created by Tom Salih on 26.11.23.
//

import SwiftUI
import MapKit

struct ObjektDetailView: View {
    
    @EnvironmentObject var objektVM: ObjektViewModel
    
    @State var showUpdateCleaningdaysSheet = false
    @State var showUpdateQsIntervallSheet = false
    @State var showUpdateObjektInformations = false
    
    @State var cleaningDayMon = false
    @State var cleaningDayTue = false
    @State var cleaningDayWed = false
    @State var cleaningDayThu = false
    @State var cleaningDayFri = false
    
    let name: String
    let mail: String
    let id: String
    let objektAdress: Adress
    let contactPerson: String
    let cleaningPerson: String
    let objectManager: String
    @State var objektId = ""
    
    init(objekt: Objekt){
        self.objektId = objekt.id ?? ""
        self.name = objekt.name
        self.mail = objekt.mail
        self.id = objekt.id ?? ""
        self.objektAdress = objekt.adress
        self.contactPerson = objekt.contactPerson ?? ""
        self.objectManager = objekt.objectManager ?? ""
        self.cleaningPerson = objekt.cleaningPerson ?? ""
        self.cleaningDayMon = objekt.cleaningDayMon
        self.cleaningDayTue = objekt.cleaningDayTue
        self.cleaningDayWed = objekt.cleaningDayWed
        self.cleaningDayThu = objekt.cleaningDayThu
        self.cleaningDayFri = objekt.cleaningDayFri
    }
        
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                CustomHeaderBack(title: self.name){
                    
                    Button(action: {
                        showUpdateObjektInformations = true
                    }, label: {
                        CustomHeaderIcon(icon: Values.editIcon)
                    })
                }
                .sheet(isPresented: $showUpdateObjektInformations){
                    UpdateObjektInfoSheet(showUpdateObjektInformations: $showUpdateObjektInformations, name: self.name, adress: self.objektAdress, mail: self.mail, contactPerson: self.contactPerson, objectManager: self.objectManager, cleaningPerson: self.cleaningPerson, objektId: self.id).environmentObject(objektVM)
                }
                
                ScrollView{
                    
                    MapView(latitude: self.objektAdress.lat ?? 0.0, longitude: self.objektAdress.lon ?? 0.0)
                        .mapModi()
                    
                    VStack(spacing:20){
                        AdressItem(title: "Adresse", street: "\(self.objektAdress.street) \(self.objektAdress.housenumber)", postalCode: self.objektAdress.postalCode, city: self.objektAdress.city)
                            .padding(.top, Values.minorPadding)
                        
                        ObjektDataItem(title: "Ansprechpartner"){
                            Text(self.mail)
                                .itemSubtitleModi()
                        }
                        
                        ObjektDataItem(title: "Ansprechpartner"){
                            Text(self.contactPerson)
                                .itemSubtitleModi()
                        }
                        
                        ObjektDataItem(title: "Objektleiter"){
                            Text(self.objectManager )
                                .itemSubtitleModi()
                        }
                        
                        ObjektDataItem(title: "Reinigungskraft"){
                            Text(self.cleaningPerson )
                                .itemSubtitleModi()
                        }
                        
                        TitleComponent(title: "LEISTUNGSVERZEICHNIS"){
                            NavigationLink(destination: AddAreaView()){
                                IconComponente(icon: Values.plus)
                            }
                            .navigationBarBackButtonHidden(true)
                        }
                        NavigationLink(destination: ListOfServicesAreaView()){
                            LvItem(title: "Leistungsverzeichnis BLOCK A")
                        }
                        
                        TitleComponent(title: "REINIGUNGSTAGE"){
                            Button(action: {
                                showUpdateCleaningdaysSheet = true
                            }, label: {
                                IconComponente(icon: Values.editIcon)
                            })
                        }
                        .sheet(isPresented: $showUpdateCleaningdaysSheet){
                            UpdateCleaningDaysSheet(objektId: $objektId, showUpdateCleaningdaysSheet: $showUpdateCleaningdaysSheet)
                                .presentationDetents([.medium])
                                .presentationDragIndicator(.hidden)
                                .environmentObject(objektVM)
                        }
                        
                        CheckmarkComponente(cleaningDayMon: $cleaningDayMon, cleaningDayTue: $cleaningDayTue, cleaningDayWed: $cleaningDayWed, cleaningDayThu: $cleaningDayThu, cleaningDayFri: $cleaningDayFri, isEditable: false
                        )
                        
                        TitleComponent(title: "QS INTERVALL"){
                            Button(action: {
                                showUpdateQsIntervallSheet = true
                            }, label: {
                                IconComponente(icon: Values.editIcon)
                            })
                        }
                        .sheet(isPresented: $showUpdateQsIntervallSheet){
                            UpdateIntervallSheet(showUpdateQsIntervallSheet: $showUpdateQsIntervallSheet)
                                .presentationDetents([.medium])
                                .presentationDragIndicator(.hidden)
                        }
                        
                        IntervallComponente()
                        
                        TitleComponent(title: "QUALITÄTSSICHERUNG"){
                            NavigationLink(destination: QsView()){
                                IconComponente(icon: Values.startQSIcon)
                            }
                            .navigationBarBackButtonHidden(true)
                        }
                        NavigationLink(destination: QsHistoryView(rating: .constant(3))){
                            QsOverviewItem(rating: .constant(3))
                                .padding(.bottom, 30)
                        }
                        .navigationBarBackButtonHidden(true)
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal, Values.middlePadding)
            }
            .background(Color.appBackground)
        }
    }
}

//
//#Preview {
//    ObjektDetailView(adress: Adress(street: "", housenumber: "", postalCode: "", city: "", lon: 0.0, lat: 0.0), contactPerson: "", objectManager: "", cleaningPerson: "", objekt: Objekt(name: "", adress: Adress(street: "", housenumber: "", postalCode: "", city: "", lon: 0.0, lat: 0.0), mail: ""))
//}
