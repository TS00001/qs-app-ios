//
//  SmallRatingView.swift
//  QS_APP
//
//  Created by Tom Salih on 10.12.23.
//

import SwiftUI

struct SmallRatingView: View {
    
        
        @Binding var rating: Int
        
        var label = ""
        var maximumRating = 5
        
        var offImage: Image?
        var onImage = Image(systemName: "star.fill")
        
        var offColor = Color.appBlue.opacity(0.3)
        var onColor = Color.appYellow
        
        var body: some View {
            HStack{
                if label.isEmpty == false {
                    Text(label)
                }
                ForEach(1..<maximumRating + 1, id:\.self){ number in
                    Button {
                        rating = number
                    }label: {
                        image(for: number)
                            .font(.custom("futura", size: 10))
                            .foregroundStyle(number > rating ? offColor : onColor)
                    }
                }
            }
//            .frame(maxWidth: .infinity, alignment: .center)
//            .buttonStyle(.plain)
            .padding(10)
            .background(.appBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 2)
        }
        
        func image(for number: Int) -> Image {
            if number > rating {
                offImage ?? onImage
            } else {
                onImage
            }
        }
}

#Preview {
    SmallRatingView(rating: .constant(4))
}
