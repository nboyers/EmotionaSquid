//
//  ContentView.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 1/23/22.
//

import SwiftUI

struct NewUserLoginView: View {
    @State private var willMoveToNextScreen = false
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .foregroundColor(.blue)
                
                Spacer()
                
                Text("FIX ME AT SOME POINT").padding()

                Button(action: {
                    self.willMoveToNextScreen = true
                }) {
                    HStack {
                        Text("Set up account")
                            .fontWeight(.semibold)
                            .font(.title)
                        Image(systemName: "arrow.right")
                            .font(.title)
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(40)
                    .padding(.horizontal, 20)
                }
                Spacer()
                    .frame(height: geo.size.height  / 10)
            }.navigate(to: OnBoardingView(), when: $willMoveToNextScreen)
        }
    }
}

struct NewUserLoginView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserLoginView()
    }
}
