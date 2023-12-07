//
//  UpdateCleaningDaysSheet.swift
//  QS_APP
//
//  Created by Tom Salih on 07.12.23.
//

import SwiftUI

struct UpdateCleaningDaysSheet: View {
    
    @Binding var showUpdateCleaningdaysSheet: Bool
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    UpdateCleaningDaysSheet(showUpdateCleaningdaysSheet: .constant(false))
}
