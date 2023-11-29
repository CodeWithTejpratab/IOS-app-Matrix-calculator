//
//  CircleImage.swift
//  NumericalCMPT
//
//  Created by Rahul Ramjeawon on 11/24/23.
//

import SwiftUI


struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 4)
    }
}

#Preview {
    CircleImage()
}

