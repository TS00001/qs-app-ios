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
    @State var selectedOption: Int?
    
    @State var objekt: Objekt
    
    init(objekt: Objekt){
        self.objekt = objekt
        print("TEST_1")
    }
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                CustomHeaderBack(title: objekt.name){
                    
                    Button(action: {
                        showUpdateObjektInformations = true
                    }, label: {
                        CustomHeaderIcon(icon: Values.editIcon)
                    })
                }
                .sheet(isPresented: $showUpdateObjektInformations){
                    
                    //TODO: Das ganze Objekt mitgeben
                    UpdateObjektInfoSheet(showUpdateObjektInformations: $showUpdateObjektInformations, objekt: objekt).environmentObject(objektVM)
                }
                
                ScrollView{
                    
                    MapView(latitude: objekt.adress.lat ?? 0.0, longitude: objekt.adress.lon ?? 0.0)
                        .mapModi()
                    
                    VStack(spacing:20){
                        AdressItem(title: "Adresse", street: "\(objekt.adress.street) \(self.objekt.adress.housenumber)", postalCode: objekt.adress.postalCode, city: objekt.adress.city)
                            .padding(.top, Values.minorPadding)
                        
                        ObjektDataItem(title: "Ansprechpartner"){
                            Text(objekt.mail)
                                .itemSubtitleModi()
                        }
                        
                        ObjektDataItem(title: "Ansprechpartner"){
                            Text(objekt.contactPerson ?? "")
                                .itemSubtitleModi()
                        }
                        
                        ObjektDataItem(title: "Objektleiter"){
                            Text(objekt.objectManager ?? "")
                                .itemSubtitleModi()
                        }
                        
                        ObjektDataItem(title: "Reinigungskraft"){
                            Text(objekt.cleaningPerson ?? "")
                                .itemSubtitleModi()
                        }
                        
                        TitleComponent(title: "LEISTUNGSVERZEICHNIS"){
                            NavigationLink(destination: AddAreaView(objektID: objekt.id ?? "").environmentObject(objektVM)){
                                IconComponente(icon: Values.plus)
                            }
                            .navigationBarBackButtonHidden(true)
                            
                        }
                        NavigationLink(destination: ListOfServicesAreaView().environmentObject(objektVM)){
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
                            UpdateCleaningDaysSheet(objekt: $objekt, showUpdateCleaningdaysSheet: $showUpdateCleaningdaysSheet)
                                .presentationDetents([.medium])
                                .presentationDragIndicator(.hidden)
                                .environmentObject(objektVM)
                        }
                        
                        CheckmarkComponente(objekt: $objekt, isEditable: false)
                        
                        TitleComponent(title: "QS INTERVALL"){
                            Button(action: {
                                showUpdateQsIntervallSheet = true
                            }, label: {
                                IconComponente(icon: Values.editIcon)
                            })
                        }
                        .sheet(isPresented: $showUpdateQsIntervallSheet){
                            UpdateIntervallSheet(objekt: $objekt, showUpdateQsIntervallSheet: $showUpdateQsIntervallSheet)
                                .presentationDetents([.medium])
                                .presentationDragIndicator(.hidden)
                        }
                        
                        IntervallComponente(selectedOption: $objekt.interval, objekt: $objekt)
                        
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
