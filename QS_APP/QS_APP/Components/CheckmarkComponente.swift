//
//  CheckmarkComponente.swift
//  QS_APP
//
//  Created by Tom Salih on 05.12.23.
//

import SwiftUI

struct CheckmarkComponente: View {
    @State var cleaningDayMon = false
    @State var cleaningDayTue = false
    @State var cleaningDayWed = false
    @State var cleaningDayThu = false
    @State var cleaningDayFri = false
    
    
    @Binding var objekt: Objekt
    @State var isEditable: Bool
    
//    init(objekt: Objekt, isEditable: Bool){
//        self._cleaningDayMon = State(wrappedValue: objekt.cleaningDayMon)
//        self._cleaningDayTue = State(wrappedValue: objekt.cleaningDayTue)
//        self._cleaningDayWed = State(wrappedValue: objekt.cleaningDayWed)
//        self._cleaningDayThu = State(wrappedValue: objekt.cleaningDayThu)
//        self._cleaningDayFri = State(wrappedValue: objekt.cleaningDayFri)
//        self.isEditable = isEditable
//    }
    
    var body: some View {
            HStack(spacing: 20) {
                DayCheckbox(day: "MO", isEditable: isEditable, isChecked: $objekt.cleaningDayMon)
                DayCheckbox(day: "DI", isEditable: isEditable, isChecked: $objekt.cleaningDayTue)
                DayCheckbox(day: "MI", isEditable: isEditable, isChecked: $objekt.cleaningDayWed)
                DayCheckbox(day: "DO", isEditable: isEditable, isChecked: $objekt.cleaningDayThu)
                DayCheckbox(day: "FR", isEditable: isEditable, isChecked: $objekt.cleaningDayFri)
            }
            .frame(maxWidth: .infinity)
            .background(Color.appBlue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 2)
        }
    }

//TODO: EIGENE KOMPONENTE
    struct DayCheckbox: View {
        var day: String
        let isEditable: Bool
        @Binding var isChecked: Bool

        var body: some View {
            VStack {
                Text(day)
                    .font(.custom(FontStrings.appFontBlack, size: 30))
                    .padding(.top, 20)
                    .foregroundColor(.white)

                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.vertical, 10)
                    .padding(.bottom, 20)
                    .foregroundColor(.appBackground)
                    .bold()
                    .onTapGesture {
                        if isEditable {
                            isChecked.toggle()
                        }
                    }
            }
        }
    }
    

//#Preview {
//    CheckmarkComponente(cleaningDayMon: .constant(false), cleaningDayTue: .constant(false), cleaningDayWed: .constant(false), cleaningDayThu: .constant(false), cleaningDayFri: .constant(false), isEditable: false)
//}
