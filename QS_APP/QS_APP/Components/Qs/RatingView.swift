//
//  RatingView.swift
//  QS_APP
//
//  Created by Tom Salih on 27.11.23.
//

import SwiftUI

struct RatingView: View {
    
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
                        .font(.largeTitle)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .buttonStyle(.plain)
        .padding(Values.majorPadding)
        .background(.appBackground)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: Values.minorRadius)
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
    RatingView(rating: .constant(3))
}
