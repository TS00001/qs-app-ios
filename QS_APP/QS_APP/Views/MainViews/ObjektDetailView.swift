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
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                CustomHeaderBack(title: objektVM.objekt.name){
                    
                    Button(action: {
                        objektVM.showUpdateObjektInformations = true
                    }, label: {
                        CustomHeaderIcon(icon: Values.editIcon)
                    })
                }
                .sheet(isPresented: $objektVM.showUpdateObjektInformations){
                    UpdateObjektInfoSheet().environmentObject(objektVM)
                }
                ScrollView{
                    MapView(latitude: objektVM.objekt.adress.lat ?? 0.0, longitude: objektVM.objekt.adress.lon ?? 0.0)
                        .mapModi()
                    
                    VStack(spacing:20){
                        
                        AdressItem(title: "Adresse", street: "\(objektVM.objekt.adress.street) \(self.objektVM.objekt.adress.housenumber)", postalCode: objektVM.objekt.adress.postalCode, city: objektVM.objekt.adress.city)
                            .padding(.top, Values.minorPadding)
                        
                        ObjektDataItem(title: "Ansprechpartner"){
                            Text(objektVM.objekt.mail)
                                .itemSubtitleModi()
                        }
                        
                        ObjektDataItem(title: "Ansprechpartner"){
                            Text(objektVM.objekt.contactPerson ?? "")
                                .itemSubtitleModi()
                        }
                        
                        ObjektDataItem(title: "Objektleiter"){
                            Text(objektVM.objekt.objectManager ?? "")
                                .itemSubtitleModi()
                        }
                        
                        ObjektDataItem(title: "Reinigungskraft"){
                            Text(objektVM.objekt.cleaningPerson ?? "")
                                .itemSubtitleModi()
                        }
                        
                        TitleComponent(title: "LEISTUNGSVERZEICHNIS"){
                            NavigationLink(destination: AddAreaView().environmentObject(objektVM)){
                                IconComponente(icon: Values.plus)
                            }
                            .navigationBarBackButtonHidden(true)
                            
                        }
                        NavigationLink(destination: ListOfServicesAreaView().environmentObject(objektVM)){
                            LvItem(title: "Leistungsverzeichnis BLOCK A")
                        }
                        
                        TitleComponent(title: "REINIGUNGSTAGE"){
                            Button(action: {
                                objektVM.showUpdateCleaningdaysSheet = true
                            }, label: {
                                IconComponente(icon: Values.editIcon)
                            })
                        }
                        .sheet(isPresented: $objektVM.showUpdateCleaningdaysSheet){
                            UpdateCleaningDaysSheet(objekt: $objektVM.objekt, showUpdateCleaningdaysSheet: $objektVM.showUpdateCleaningdaysSheet)
                                .presentationDetents([.medium])
                                .presentationDragIndicator(.hidden)
                                .environmentObject(objektVM)
                        }
                        
                        CheckmarkComponente(objekt: $objektVM.objekt, isEditable: false)
                        
                        TitleComponent(title: "QS INTERVALL"){
                            Button(action: {
                                objektVM.showUpdateQsIntervallSheet = true
                            }, label: {
                                IconComponente(icon: Values.editIcon)
                            })
                        }
                        .sheet(isPresented: $objektVM.showUpdateQsIntervallSheet){
                            UpdateIntervallSheet(objekt: $objektVM.objekt, showUpdateQsIntervallSheet: $objektVM.showUpdateQsIntervallSheet)
                                .presentationDetents([.medium])
                                .presentationDragIndicator(.hidden)
                        }
                        
                        IntervallComponente(selectedOption: $objektVM.objekt.interval, objekt: $objektVM.objekt)
                        
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
