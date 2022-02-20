//
//  OnBoardingView.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 2/9/22.
//

import SwiftUI
import iPhoneNumberField

struct OnBoardingView: View {
    @State private var phoneNumber: String = ""
    @State var isEditing: Bool = false
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
                Text("What's your number?")
                    .font(.title)
                    .fontWeight(.heavy)
                
                iPhoneNumberField("(000) 000-0000", text: $phoneNumber, isEditing: $isEditing)
                    .flagHidden(false)
                    .flagSelectable(true)
                    .font(UIFont(size: 30, weight: .light, design: .monospaced))
                    .maximumDigits(10)
                    .foregroundColor(Color.pink)
                    .clearButtonMode(.whileEditing)
                    .onClear { _ in isEditing.toggle() }
                    .accentColor(Color.orange)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: isEditing ? .secondary : .white, radius: 10)
                    .padding()
                Spacer()
                Spacer()
                Text("By tapping Continue, you are accept our TOS and Privacy Policy")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding()
                
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
            .background(Color.teal)
            .navigate(to: PhoneVerificationView(), when: $willMoveToNextScreen)
            .navigate(to: NewUserLoginView(), when: $willMoveBack)
        }
    }
}


struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
