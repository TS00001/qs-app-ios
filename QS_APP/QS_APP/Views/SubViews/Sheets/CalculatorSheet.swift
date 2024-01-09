//
//  CalculatorSheet.swift
//  QS_APP
//
//  Created by Tom Salih on 04.01.24.
//

import SwiftUI

struct CalculatorSheet: View {
    
    @EnvironmentObject var calculatorVM: CalculatorViewModel
    
    var body: some View {
        
        VStack{
            TextField("Raumbezeichnung", text: $calculatorVM.roomDescription)
                .foregroundStyle(Color.appBlue)
                .font(.custom(FontStrings.appFontBlack, size: 22))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, Values.middlePadding)
                .frame(height: 30)
                .padding(.vertical, Values.middlePadding)
                .background(Color.appBackground)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, Values.middlePadding)
                .padding(.top, 40)
                .padding(.bottom, Values.minorPadding)
                .shadow(radius: Values.minorShadow)
            
            TextField("Quadratmeterzahl eingeben", text: $calculatorVM.quadratmeter)
                .foregroundStyle(Color.appBlue)
                .font(.custom(FontStrings.appFontBlack, size: 22))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, Values.middlePadding)
                .frame(height: 30)
                .padding(.vertical, Values.middlePadding)
                .background(Color.appBackground)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, Values.middlePadding)
                .padding(.top, Values.middlePadding)
                .padding(.bottom, Values.majorPadding)
                .shadow(radius: Values.minorShadow)
                .keyboardType(.numberPad)
            
            Spacer()
            
            Text("WÄHLE EINEN FAKTOR FÜR DIE BERECHNUNG AUS!")
                .font(.custom(FontStrings.appFontBlack, size: Values.appSubtitle))
                .bold()
                .foregroundStyle(Color.appBlue)
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(.bottom, Values.middlePadding)
                
            
            
            HStack {
                ForEach(calculatorVM.multipliers, id: \.self) { multiplier in
                    Button(action: {
                        self.calculatorVM.selectedMultiplier = multiplier
                    }) {
                        
                        VStack{
                            Image(systemName: calculatorVM.iconForMultiplier(multiplier))
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(10)
                                .background(calculatorVM.selectedMultiplier == multiplier ? .appBlue : .appBackground)
                                .foregroundColor(calculatorVM.selectedMultiplier == multiplier ? .appBackground : .gray)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .shadow(radius: 2)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal, Values.middlePadding)
                    }
                    
                }
            }
            
            Spacer()
            
            StandardButton(label: "BERECHNEN", color: .appBlue, fontColor: .appBackground){
                calculatorVM.calculateResult()
                calculatorVM.calculateTotal()
                calculatorVM.roomDescription = ""
                calculatorVM.quadratmeter = ""
                calculatorVM.showCalculatorSheet.toggle()
            }
            .padding(Values.middlePadding)
        }
        
    }
    
    
}

#Preview {
    CalculatorSheet()
}
