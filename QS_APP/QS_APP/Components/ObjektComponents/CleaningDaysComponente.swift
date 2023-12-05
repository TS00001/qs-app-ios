//
//  CleaningDaysComponente.swift
//  QS_APP
//
//  Created by Tom Salih on 05.12.23.
//

import SwiftUI

struct CleaningDaysComponente: View {
    @State private var selectedDays: Set<String> = []

        var body: some View {
            VStack {
                Text("Reinigungstage auswählen")
                    .font(.title)
                    .padding()

//                ScrollView {
                    ForEach(["MO", "DI", "MI", "DO", "FR"], id: \.self) { day in
                        HStack{
                            VStack {
                                Text(day)
                                    .font(.headline)

    //                            Spacer()

                                Image(systemName: self.selectedDays.contains(day) ? "checkmark.square.fill" : "square")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .onTapGesture {
                                        self.toggleSelection(day: day)
                                    }
                            }
                            .padding()
                        }
                       
                    }
                }
            }
        

        func toggleSelection(day: String) {
            if selectedDays.contains(day) {
                selectedDays.remove(day)
            } else {
                selectedDays.insert(day)
            }
        }
    }

#Preview {
    CleaningDaysComponente()
}
