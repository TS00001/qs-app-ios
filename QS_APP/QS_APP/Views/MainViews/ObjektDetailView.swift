//
//  ObjektDetailView.swift
//  QS_APP
//
//  Created by Tom Salih on 26.11.23.
//

import SwiftUI
import MapKit

struct ObjektDetailView: View {
    
    
    let adress = CLLocationCoordinate2D(latitude: 48.51959861846929, longitude: 9.057984167586223)
    
    var body: some View {
        
        ZStack{
            AppBackground(color: .appBackground)
            
            VStack(spacing: 0){
                CustomHeader(title: "OBJEKTNAME"){
                    
                    Button(action: {
                        
                    }, label: {
                        CustomHeaderIcon(icon: Values.qsIcon)
                    })
                }
                ScrollView{
                    
                    Map() {
                        Marker("OBJEKT", systemImage: Values.objektIcon, coordinate: adress)
                            .tint(.appBlue)
                        
                    }
                    
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(maxWidth: .infinity)
                    .frame(height: 150)
                    .padding(.bottom, 30)
                    .padding(.top, 40)
                    .shadow(radius: Values.minorShadow)
                    
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
                        
                        
                        //TODO: Componente mit Button zum bearbeiten der reinigungstage (in einem sheet)
                        Text("REINIGUNGSTAGE")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.custom(FontStrings.appFontBlack, size: 30))
                            .foregroundColor(.appBlue)
                            .padding(.top, 20)
                        
                        CheckmarkComponente()
                        
                        Text("QS INTERVALL")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.custom(FontStrings.appFontBlack, size: 30))
                            .foregroundColor(.appBlue)
                            .padding(.top, 20)
                        IntervallComponente()
                        
                        Text("QUALITÄTSSICHERUNG")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.custom(FontStrings.appFontBlack, size: 30))
                            .foregroundColor(.appBlue)
                            .padding(.top, 20)
                        QsOverviewItem()
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal, Values.middlePadding)
            }
        }
    }
}


#Preview {
    ObjektDetailView()
}
