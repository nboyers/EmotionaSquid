//
//  OnBoardingView.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 2/9/22.
//

import SwiftUI
import Combine

struct OnBoardingView: View {
    @State private var phoneNumber: String = ""
    @State private var isShowingSquidView = false
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Spacer()
                Text("What's your number?")
                    .font(.title)
                    .fontWeight(.heavy)
                
                TextField("Enter phone number", text: $phoneNumber)
                    .keyboardType(.phonePad)
                    .onReceive(Just(phoneNumber)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.phoneNumber = filtered
                        }
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.black, lineWidth: 5)
                    )
                    .padding()
                Spacer()
                Spacer()
                Text("By tapping Continue, you are accept our TOS and Privacy Policy")
                    .fontWeight(.ultraLight)
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack {
                    //FIXME: Has two back buttons when it should only be one 
                    NavigationLink(destination: PhoneVerificationView()) {
                        Text("Continue")
                            .navigationBarTitle("")
                            .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(true)
                    }
                    Image(systemName: "arrow.right")
                        .font(.title)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.teal,Color.accentColor]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(40)
                .padding(.horizontal, 20)
            }
            Spacer().frame(height: 50)
            
        }
    }
}


struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
