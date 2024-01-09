//
//  CalculatorView.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import SwiftUI

struct CalculatorView: View {
    
    @StateObject private var calculatorVM = CalculatorViewModel()
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 0){
                
                CustomHeader(title: "RECHNER"){
                    
                    Button(action:{
                        calculatorVM.showCalculatorSheet.toggle()
                    }, label: {
                        CustomHeaderIcon(icon: Values.plus)
                    })
                }
                .sheet(isPresented: $calculatorVM.showCalculatorSheet){
                    CalculatorSheet()
                        .environmentObject(calculatorVM)
                        .presentationDetents([.height(550)])
                }
                
                List(calculatorVM.resultList, id: \.roomDescription) { result in
                    VStack(alignment: .leading) {
                        Text(result.roomDescription)
                            .font(.custom(FontStrings.appFontBlack, size: 22))
                            .foregroundStyle(Color.appBlue)
                        
                        HStack{
                            
                            Text("Quadratmeter:  \(String(format: "%.2f", result.quadratmeter)) m²")
                                .font(.custom(FontStrings.appFontBold, size: 16))
                                .foregroundStyle(Color.appBlue)
                            
                            Spacer()
                            
                            Text(" \(calculatorVM.formattedResult(result.hours)) Std.")
                                .font(.custom(FontStrings.appFontBold, size: 16))
                                .foregroundStyle(Color.appBlue)
                        }
                    }
                }
                .padding(.bottom, Values.middlePadding)
                .background(Color.appBackground)
                .scrollContentBackground(.hidden)
                .swipeActions {
                    Button(role: .destructive) {
                        withAnimation {
                            
                        }
                    } label: {
                        Label("Löschen", systemImage: "trash")
                    }
                }
                
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading){
                            Text("Gesammt")
                                .font(.custom(FontStrings.appFontBlack, size: 22))
                                .foregroundStyle(Color.appBackground)
                            
                            HStack{
                                
                                Text("Quadratmeter:  \(String(format: "%.2f", Double(calculatorVM.totalQuadratmeter) )) m²")
                                    .font(.custom(FontStrings.appFontBold, size: 16))
                                    .foregroundStyle(Color.appBackground)
                                
                                Spacer()
                                
                                Text(" \(String(format: "%.2f", calculatorVM.totalHours)) Std.")
                                    .font(.custom(FontStrings.appFontBold, size: 16))
                                    .foregroundStyle(Color.appBackground)
                                
                                
                                
                            }
                            
                        }
                        .padding(15)
                        
                    }
                    .background(.appBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.bottom, 20)
                    .padding(.horizontal, Values.middlePadding)
                    
                
                StandardButton(label: "SPEICHERN", color: .appBlue, fontColor: .appBackground, action: {
//                    calculatorVM.calculateTotal()
//                    calculatorVM.createOffer(offer: calculatorVM.)
                })
                .padding(.bottom, 50)
                .padding(.horizontal, Values.middlePadding)
                
            }
            .background(Color.appBackground)
        }
        
        
    }
    
}

#Preview {
    CalculatorView()
}
