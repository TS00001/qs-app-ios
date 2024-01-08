//
//  HomeView.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var qsVM = ObjektViewModel()
    
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
                
                List(1...3, id: \.self){ item in
                    NavigationLink(destination: QsView().environmentObject(qsVM) ){
                        VStack(alignment: .leading, spacing: 0){
                            HStack{
                                VStack{
                                    Image(systemName: Values.objektIcon)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .foregroundStyle(Color.appBlue)
                                }
                                VStack(alignment: .leading){
                                    Text("Bäckerei")
                                        .font(.custom(FontStrings.appFontBlack, size: 22))
                                        .foregroundStyle(Color.appBlue)
                                    HStack{
                                        Text("Musterstraße 21")
                                            .font(.custom(FontStrings.appFontBold, size: 16))
                                            .foregroundStyle(Color.appBlue)
                                    }
                                }
                            }
                        }
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
