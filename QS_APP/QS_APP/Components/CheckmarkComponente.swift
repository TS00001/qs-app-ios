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
    
    var body: some View {
            HStack(spacing: 20) {
                DayCheckbox(day: "MO", isChecked: $cleaningDayMon)
                DayCheckbox(day: "DI", isChecked: $cleaningDayTue)
                DayCheckbox(day: "MI", isChecked: $cleaningDayWed)
                DayCheckbox(day: "DO", isChecked: $cleaningDayThu)
                DayCheckbox(day: "FR", isChecked: $cleaningDayFri)
            }
            .frame(maxWidth: .infinity)
            .background(Color.appBlue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 2)
        }
    }

    struct DayCheckbox: View {
        var day: String
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
                        isChecked.toggle()
                    }
            }
        }
    }
    

#Preview {
    CheckmarkComponente(cleaningDayMon: .constant(false), cleaningDayTue: .constant(false), cleaningDayWed: .constant(false), cleaningDayThu: .constant(false), cleaningDayFri: .constant(false))
}
