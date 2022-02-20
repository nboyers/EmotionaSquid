//
//  PhoneVerificationView.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 2/9/22.
//

import SwiftUI
import Combine

struct PhoneVerificationView: View {
    @State private var phoneNumber: String = ""
    @State private var willMoveToNextScreen = false
    @State private var willMoveBack = false
    var body: some View {
       
        GeometryReader { geo in
            VStack(alignment: .center) {
                HStack {
                Button(action: {
                    self.willMoveBack = true
                }) {
                   
                        Image(systemName: "arrow.left")
                            .font(.title)
                }
                .frame(maxWidth: 10, maxHeight: 10)
                .padding()
                .foregroundColor(.white)
                .background(Color.gray)
                .cornerRadius(40)
                .padding(.horizontal, 20)
                    Spacer()
                        .frame(width:geo.size.width * 0.8)
                }
                Spacer()
                Text("Verify your number")
                    .font(.title)
                    .fontWeight(.heavy)
                
                TextField("6-Digit Code", text: $phoneNumber)
                    .keyboardType(.phonePad)
                    .onReceive(Just(phoneNumber)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.phoneNumber = filtered
                        }
                    }
                    .accentColor(Color.orange)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                
                Text("You should have recieved\n a text with your code.")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Spacer()
                Spacer()
                //FIXME: This needs authentication & Disabled until user puts in correct SMS code
                
                Button(action: {
                    self.willMoveToNextScreen = true
                }) {
                    HStack {
                        Text("Continue")
                            .fontWeight(.semibold)
                            .font(.title)
                        Image(systemName: "arrow.right")
                            .font(.title)
                        
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.teal,Color.accentColor]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(40)
                .padding(.horizontal, 20)
                Spacer()
                    .frame(height: geo.size.height / 10)
                
            }
        }
        .background(Color.teal)
        .navigate(to: SquidView(), when: $willMoveToNextScreen)
        .navigate(to: OnBoardingView(), when: $willMoveBack)
    }
}


struct PhoneVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneVerificationView()
    }
}
