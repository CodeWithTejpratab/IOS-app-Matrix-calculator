//
//  LoadingView.swift
//  NumericalCMPT
//
//  Created by Rahul Ramjeawon on 11/24/23.
//

import SwiftUI

struct LoadingView: View {
    @State private var isLoading = false
    @State private var size = 0.8
    @State private var opacity = 0.5
        
    var body: some View {
        if isLoading{
            ZStack {
                ButtonUI()
            }
        }
        else{
            ZStack {
                Color.accentColor.opacity(0.137)
                    .ignoresSafeArea()
                ZStack{
                    CircleImage()
                        .offset(y: -100)
                        .padding(.bottom, -200)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.5)){
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
            }
                .onAppear {
                    // Simulate a delay or asynchronous task
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation {
                            self.isLoading = true
                        }
                    }
                }
            }
        }
    }


#Preview {
    LoadingView()
}
