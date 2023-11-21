//
//  ObjektView.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import SwiftUI

struct ObjektView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.appBackground)
                .ignoresSafeArea()
            
            
            VStack{
                HStack {
                    Text("OBJEKTE")
                        .foregroundStyle(Color.appBlue)
                        .font(.custom(FontStrings.appFontBlack, size: 35))
                        .bold()
                    .padding(20)
                    Spacer()
                }
                
                //TO DO: SearchBar Implementieren
                
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
//                    .tint(.pink)
                    .background(Color.appBackground)
                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
}

#Preview {
    ObjektView()
}
