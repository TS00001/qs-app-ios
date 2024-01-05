//
//  CalculatorView.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import SwiftUI


struct Result {
    var roomDescription: String
    var quadratmeter: Double
    var value: Double
}

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
                
//                TextField("Raumbezeichnung", text: $calculatorVM.roomDescription)
//                    .foregroundStyle(Color.appBlue)
//                    .font(.custom(FontStrings.appFontBlack, size: 22))
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.leading, Values.middlePadding)
//                    .frame(height: 30)
//                    .padding(.vertical, Values.middlePadding)
//                    .background(Color.appBackground)
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .padding(.horizontal, Values.middlePadding)
//                    .padding(.top, Values.middlePadding)
//                    .padding(.bottom, Values.minorPadding)
//                    .shadow(radius: Values.minorShadow)
//                
//                TextField("Quadratmeterzahl eingeben", text: $calculatorVM.quadratmeter)
//                    .foregroundStyle(Color.appBlue)
//                    .font(.custom(FontStrings.appFontBlack, size: 22))
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.leading, Values.middlePadding)
//                    .frame(height: 30)
//                    .padding(.vertical, Values.middlePadding)
//                    .background(Color.appBackground)
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .padding(.horizontal, Values.middlePadding)
//                    .padding(.top, Values.middlePadding)
//                    .padding(.bottom, Values.majorPadding)
//                    .shadow(radius: Values.minorShadow)
//                    .keyboardType(.numberPad)
//                
//                
//                
//                Text("WÄHLE EINEN FAKTOR FÜR DIE BERECHNUNG AUS!")
//                    .font(.custom(FontStrings.appFontBlack, size: Values.appSubtitle))
//                    .bold()
//                    .foregroundStyle(Color.appBlue)
//                    .frame(maxWidth: .infinity, alignment: .center)
//                    .multilineTextAlignment(.center)
//                    .padding(.bottom, Values.middlePadding)
//                
                
//                HStack {
//                    ForEach(calculatorVM.multipliers, id: \.self) { multiplier in
//                        Button(action: {
//                            self.calculatorVM.selectedMultiplier = multiplier
//                        }) {
//                            
//                            VStack{
//                                Image(systemName: calculatorVM.iconForMultiplier(multiplier))
//                                    .resizable()
//                                    .frame(width: 30, height: 30)
//                                    .padding(15)
//                                    .background(calculatorVM.selectedMultiplier == multiplier ? .appBlue : .appBackground)
//                                    .foregroundColor(calculatorVM.selectedMultiplier == multiplier ? .appBackground : .gray)
//                                    .clipShape(RoundedRectangle(cornerRadius: 5))
//                                    .shadow(radius: 2)
//                            }
//                            .frame(maxWidth: .infinity, alignment: .center)
//                            .padding(.horizontal, Values.middlePadding)
//                        }
//                    }
//                }
//                Spacer()
                
                List(calculatorVM.results, id: \.roomDescription) { result in
                    VStack(alignment: .leading) {
                        Text(result.roomDescription)
                            .font(.custom(FontStrings.appFontBlack, size: 22))
                            .foregroundStyle(Color.appBlue)
                        
                        HStack{
                            
                            Text("Quadratmeter:  \(String(format: "%.2f", result.quadratmeter)) m²")
                                .font(.custom(FontStrings.appFontBold, size: 16))
                                .foregroundStyle(Color.appBlue)
                            
                            Spacer()
                            
                            Text(" \(calculatorVM.formattedResult(result.value)) Stunden")
                                .font(.custom(FontStrings.appFontBold, size: 16))
                                .foregroundStyle(Color.appBlue)
                        }
                    }
                }
                .background(Color.appBackground)
                .scrollContentBackground(.hidden)
                
                
                
            }
            .background(Color.appBackground)
            
        }
    }
    
    
    
    
    
    
}

#Preview {
    CalculatorView()
}
