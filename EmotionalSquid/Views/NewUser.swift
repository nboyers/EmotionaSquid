//
//  ContentView.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 1/23/22.
//

import SwiftUI

struct NewUser: View {
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
                
                Text("Cute Squids to fit your mood")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.blue)
                    .multilineTextAlignment(.center)
                    .padding()

                Button(action: {
                    self.willMoveToNextScreen = true
                }) {
                    HStack {
                        Text("Aquire the Squids")
                            .fontWeight(.semibold)
                            .font(.title)
                        Image("backArrow.png")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.accentRed)
                    .cornerRadius(40)
                    .padding(.horizontal, 20)
                }
                Spacer()
                    .frame(height: geo.size.height  / 10)
            }
            .background(Color.backgroundGreen)
            .navigate(to: PhoneAuth(), when: $willMoveToNextScreen)
                
        }
    }
}

struct NewUserLoginView_Previews: PreviewProvider {
    static var previews: some View {
        NewUser()
    }
}
