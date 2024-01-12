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
    @State var objekt: Objekt
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                CustomHeaderBack(title: self.objekt.name.uppercased()){
                    
                    Button(action: {
                        objektVM.showUpdateObjektInformations = true
                    }, label: {
                        CustomHeaderIcon(icon: Values.editIcon)
                    })
                }
                .sheet(isPresented: $objektVM.showUpdateObjektInformations){
                    UpdateObjektInfoSheet(objekt: $objekt).environmentObject(objektVM)
                }
                ScrollView{
                    MapView(latitude: objekt.adress.lat ?? 0.0, longitude: objekt.adress.lon ?? 0.0)
                        .mapModi()
                    
                    VStack(spacing:20){
                        
                        AdressItem(title: "Adresse", street: "\(objekt.adress.street) \(objekt.adress.housenumber)", postalCode: objekt.adress.postalCode, city: objekt.adress.city)
                            .padding(.top, Values.minorPadding)
                        
                        ObjektDataItem(title: "Mail"){
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
                        
                        NavigationLink(destination: ListOfServicesAreaView(objekt: objekt).environmentObject(objektVM)){
                            LvItem(title: "Leistungsverzeichnis")
                        }
                        
                        TitleComponent(title: "REINIGUNGSTAGE"){
                            Button(action: {
                                objektVM.showUpdateCleaningdaysSheet = true
                            }, label: {
                                IconComponente(icon: Values.editIcon)
                            })
                        }
                        .sheet(isPresented: $objektVM.showUpdateCleaningdaysSheet){
                            UpdateCleaningDaysSheet(objekt: $objekt, showUpdateCleaningdaysSheet: $objektVM.showUpdateCleaningdaysSheet)
                                .presentationDetents([.medium])
                                .presentationDragIndicator(.hidden)
                                .environmentObject(objektVM)
                        }
                        
                        CheckmarkComponente(objekt: $objekt, isEditable: false)
                        
                        TitleComponent(title: "QS INTERVALL"){
                            Button(action: {
                                objektVM.showUpdateQsIntervallSheet = true
                            }, label: {
                                IconComponente(icon: Values.editIcon)
                            })
                        }
                        .sheet(isPresented: $objektVM.showUpdateQsIntervallSheet){
                            UpdateIntervallSheet(objekt: $objekt, showUpdateQsIntervallSheet: $objektVM.showUpdateQsIntervallSheet)
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
