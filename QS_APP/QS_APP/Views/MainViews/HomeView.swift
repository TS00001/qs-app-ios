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
                        ButtonSquare(icon: "calendar", action: { })
                        
                        Spacer()
                        
                        ButtonSquare(icon: "list.star", action:{ })
                        
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
