//
//  HomeView.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var objektVM = ObjektViewModel()
    
    var body: some View {
        
        NavigationStack{
            
            VStack {
                CustomHeader(title: "HOME"){
                    Button(action: {
                        planQs()
                    }, label: {
                        CustomHeaderIcon(icon: Values.calendar)
                    })
                }
                
                VStack{
                    QsOverviewItem(rating: .constant(3))
                    Text("FÄLLIGE QS")
                        .font(.custom(FontStrings.appFontBlack, size: Values.appSubtitle))
                        .bold()
                        .foregroundStyle(Color.appBlue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, Values.middlePadding)
                }
                .padding(.horizontal, Values.middlePadding)
                
                List(objektVM.objektList, id: \.id){ objekt in
                    NavigationLink(destination: QsView().environmentObject(objektVM)){
                        HStack{
                            VStack{
                                Image(systemName: Values.objektIcon)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(Color.appBlue)
                                    .opacity(0.7)
                            }
                            VStack(alignment: .leading){
                                Text(objekt.name)
                                    .font(.custom(FontStrings.appFontBlack, size: 20))
                                    .foregroundStyle(Color.appBlue)
//                                    .padding(.bottom, 1)
                                HStack{
                                    
                                    Text("\(objekt.adress.street) \(objekt.adress.housenumber),")
                                        .font(.custom(FontStrings.appFontBold, size: 16))
                                        .foregroundStyle(Color.appBlue)
                                   
                                    Text("\(objekt.adress.postalCode) \(objekt.adress.city)")
                                        .font(.custom(FontStrings.appFontBold, size: 16))
                                        .foregroundStyle(Color.appBlue)
                                }
                                .opacity(0.7)
                            }
                        }
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                objektVM.deleteObjekt(with: objekt.id ?? "")
                            }
                        } label: {
                            Label("Löschen", systemImage: "trash")
                        }
                    }
//                    .simultaneousGesture(TapGesture().onEnded{
//                        objektVM.objekt = objekt
//                    })
                    .onAppear{
                        objektVM.fetchObjekt()
                    }
                    .onDisappear{
                        objektVM.cancelListener()
                    }
                }
                .background(Color.appBackground)
                .scrollContentBackground(.hidden)
            }
            .background(.appBackground)
        }
    }
    
    func planQs(){
        //TODO: Sheet um eine QS zu planen die dann in fällige QS aufgelistet werden soll
    }
}

#Preview {
    HomeView()
}
