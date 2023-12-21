//
//  CheckmarkComponente.swift
//  QS_APP
//
//  Created by Tom Salih on 05.12.23.
//

import SwiftUI

struct CheckmarkComponente: View {
    @Binding var cleaningDayMon: Bool
    @Binding var cleaningDayTue: Bool
    @Binding var cleaningDayWed: Bool
    @Binding var cleaningDayThu: Bool
    @Binding var cleaningDayFri: Bool
    @State var isEditable: Bool
    
    
    
    var body: some View {
            HStack(spacing: 20) {
                DayCheckbox(day: "MO", isEditable: $isEditable, isChecked: $cleaningDayMon)
                DayCheckbox(day: "DI", isEditable: $isEditable, isChecked: $cleaningDayTue)
                DayCheckbox(day: "MI", isEditable: $isEditable, isChecked: $cleaningDayWed)
                DayCheckbox(day: "DO", isEditable: $isEditable, isChecked: $cleaningDayThu)
                DayCheckbox(day: "FR", isEditable: $isEditable, isChecked: $cleaningDayFri)
            }
            .frame(maxWidth: .infinity)
            .background(Color.appBlue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 2)
        }
    }

    struct DayCheckbox: View {
        var day: String
        @Binding var isEditable: Bool
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
    

#Preview {
    CheckmarkComponente(cleaningDayMon: .constant(false), cleaningDayTue: .constant(false), cleaningDayWed: .constant(false), cleaningDayThu: .constant(false), cleaningDayFri: .constant(false), isEditable: false)
}
