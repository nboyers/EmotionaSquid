//
//  OnBoardingView.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 2/9/22.
//

import SwiftUI
import iPhoneNumberField

struct PhoneAuthView: View {
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
                        Image("backArrow")
                            .resizable()
                            .frame(width: 60, height: 40, alignment: .center)
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
                    .foregroundColor(Color.red)
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
                    print(phoneNumber)
                    AuthManager.shared.startAuth(phoneNumber: phoneNumber) { success in
                        guard success else { return }
                        if success {
                            self.willMoveToNextScreen = true
                        }
                    }
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
                .background(Color.accentRed)
                .cornerRadius(40)
                .padding(.horizontal, 20)
                Spacer()
                    .frame(height: geo.size.height / 10)
                
            }
            .background(Color.backgroundGreen)
            .navigate(to: VerificationView(), when: $willMoveToNextScreen)
            .navigate(to: NewUserView(), when: $willMoveBack)
        }
    }
}


struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneAuthView()
    }
}
