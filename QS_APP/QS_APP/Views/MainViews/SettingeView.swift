//
//  SettingeView.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import SwiftUI

struct SettingeView: View {
    
    @EnvironmentObject var authenticationVM: AuthenticationViewModel
    @Binding var selectedTab: TabItem
    
    var body: some View {
        
        NavigationStack {
            
            ZStack{
                Rectangle()
                    .foregroundColor(.appBackground)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("EINSTELLUNGEN")
                            .foregroundStyle(Color.appBlue)
                            .font(.custom(FontStrings.appFontBlack, size: 35))
                            .bold()
                            .padding(20)
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "power.circle.fill")
                                
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(.trailing, 15)
                                .foregroundColor(.appRed)
                        })
                        
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.appBlue)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity, maxHeight: 150)
                            .padding(.horizontal)
                            .shadow(radius: 3)
                            
                        HStack {
                            Image("profilImage")
                                .resizable()
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color.appBackground)
                            
                            .padding(.leading, 40)
                            .shadow(radius: 1)
                            
                            VStack {
                                
                                HStack {
                                    Text("Tom Salih")
                                        .font(.custom(FontStrings.appFontExtraBold, size: 32))
                                        .foregroundColor(.appBackground)
                                    .padding(.leading, 20)
                                    Spacer()
                                }
                                
                                HStack {
                                    Text("Qualitässicherung")
                                        .font(.custom(FontStrings.appFontRegular, size: 18))
                                        .foregroundColor(.appBackground)
                                    .padding(.leading, 20)
                                    Spacer()
                                }
                                
                            }
                            
                            Image(systemName: "chevron.right")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.appBackground)
                                .padding(.trailing, 30)
                            Spacer()
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.appBlue)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .padding(.horizontal)
                            .shadow(radius: 3)
                            
                        HStack {
                            Image(systemName: "shield")
                                .font(.title)
                                .bold()
                                .foregroundColor(.appBackground)
                                .padding(.leading, 40)
                            
                            VStack {
                                
                                HStack {
                                    Text("Datenschutz")
                                        .font(.custom(FontStrings.appFontMedium, size: 18))
                                        .foregroundColor(.appBackground)
                                    .padding(.leading, 20)
                                    Spacer()
                                }
                            }
                            
                            Image(systemName: "chevron.right")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.appBackground)
                                .padding(.trailing, 30)
                            Spacer()
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.appBlue)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .padding(.horizontal)
                            .shadow(radius: 3)
                            
                        HStack {
                            Image(systemName: "info.square")
                                .font(.title)
                                .bold()
                                .foregroundColor(.appBackground)
                                .padding(.leading, 40)
                            
                            VStack {
                                
                                HStack {
                                    Text("Impressum")
                                        .font(.custom(FontStrings.appFontMedium, size: 18))
                                        .foregroundColor(.appBackground)
                                    .padding(.leading, 20)
                                    Spacer()
                                }
                            }
                            
                            Image(systemName: "chevron.right")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.appBackground)
                                .padding(.trailing, 30)
                            Spacer()
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.appBlue)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .padding(.horizontal)
                            .shadow(radius: 3)
                            
                        HStack {
                            Image(systemName: "doc.plaintext")
                                .font(.title)
                                .bold()
                                .foregroundColor(.appBackground)
                                .padding(.leading, 40)
                            
                            VStack {
                                
                                HStack {
                                    Text("Lizenzen")
                                        .font(.custom(FontStrings.appFontMedium, size: 18))
                                        .foregroundColor(.appBackground)
                                    .padding(.leading, 20)
                                    Spacer()
                                }
                            }
                            
                            Image(systemName: "chevron.right")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.appBackground)
                                .padding(.trailing, 30)
                            Spacer()
                        }
                    }
                    
                    Spacer()
                }
            }
        }
    }
    
    func logout(){
        authenticationVM.logout()
        selectedTab = .home
    }
}

#Preview {
    SettingeView(selectedTab: .constant(.einstellungen))
}
