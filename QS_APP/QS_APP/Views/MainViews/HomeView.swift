//
//  HomeView.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        
        ZStack{
            Rectangle()
                .foregroundColor(.appBackground)
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    HStack{
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .padding(40)
                                .foregroundColor(.appBackground)
                                .background(Color.appBlue)
                                .cornerRadius(10)
                        })
                        .shadow(radius: 1)
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "list.star")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .padding(40)
                                .foregroundColor(.appBackground)
                                .background(Color.appBlue)
                                .cornerRadius(10)
                                
                        })
                        .shadow(radius: 1)
                        
                    }
                    .padding([.top, .leading, .trailing], 20)
                    
                    HStack {
                        Text("FÄLLIGE QS")
                            .foregroundStyle(Color.appBlue)
                            .font(.custom(FontStrings.appFontBlack, size: 35))
                            .bold()
                        .padding(20)
                        Spacer()
                    }
                    
                    NavigationStack{
                        Form{
                            Section{
                                QsListItem()
                            }.listRowBackground(Color.appBlue)
                            
                                Section{
                                    QsListItem()
                                }.listRowBackground(Color.appBlue)
                            
                                Section{
                                    QsListItem()
                                }.listRowBackground(Color.appBlue)
                            
                                Section{
                                    QsListItem()
                                }.listRowBackground(Color.appBlue)
                            
                                Section{
                                    QsListItem()
                                }.listRowBackground(Color.appBlue)
                            
                                Section{
                                    QsListItem()
                                }.listRowBackground(Color.appBlue)
                        }
                        .tint(.pink)
                        .background(Color.appBackground)
                        .scrollContentBackground(.hidden)
                    }
                    
                    
                    Spacer()
                }
                
            
            }
            
        }
    }
}

#Preview {
    HomeView()
}
