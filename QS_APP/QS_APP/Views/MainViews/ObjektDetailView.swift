//
//  ObjektDetailView.swift
//  QS_APP
//
//  Created by Tom Salih on 26.11.23.
//

import SwiftUI
import MapKit

struct ObjektDetailView: View {
    
    @State var showUpdateCleaningdaysSheet = false
    @State var showUpdateQsIntervallSheet = false
    
    func backButton(){
        
    }
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                CustomHeaderBack(title: "OBJEKTNAME"){
                    
                    Button(action: {
                        
                    }, label: {
                        CustomHeaderIcon(icon: Values.editIcon)
                    })
                }
                ScrollView{
                    
                    MapView()
                        .mapModi()
                    
                    VStack(spacing:20){
                        
                        AdressItem(title: "Adresse", street: "Musterstraße 112", postalCode: "72072", city: "Musterdtadt")
                            .padding(.top, Values.minorPadding)
                        
                        ObjektDataItem(title: "Ansprechpartner"){
                            Text("Herr Mustermann")
                                .itemSubtitleModi()
                        }
                        
                        ObjektDataItem(title: "Objektleiter"){
                            Text("Tom Salih")
                                .itemSubtitleModi()
                        }
                        
                        ObjektDataItem(title: "Reinigungskraft"){
                            Text("Martin Müller")
                                .itemSubtitleModi()
                        }
                        
                        TitleComponent(title: "LEISTUNGSVERZEICHNIS"){
                            NavigationLink(destination: AddLvView()){
                                IconComponente(icon: Values.plus)
                            }
                            .navigationBarBackButtonHidden(true)
                            
                        }
                        LvItem(title: "Leistungsverzeichnis BLOCK A")
                        LvItem(title: "Leistungsverzeichnis BLOCK B")
                        
                        TitleComponent(title: "REINIGUNGSTAGE"){
                            Button(action: {
                                showUpdateCleaningdaysSheet = true
                            }, label: {
                                IconComponente(icon: Values.editIcon)
                            })
                        }
                        .sheet(isPresented: $showUpdateCleaningdaysSheet){
                            UpdateCleaningDaysSheet(showUpdateCleaningdaysSheet: $showUpdateCleaningdaysSheet)
                                .presentationDetents([.medium])
                                .presentationDragIndicator(.hidden)
                        }
                        CheckmarkComponente()
                        
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


#Preview {
    ObjektDetailView()
}
