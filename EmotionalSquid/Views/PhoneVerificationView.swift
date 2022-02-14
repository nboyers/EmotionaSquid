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
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
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
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.black, lineWidth: 5)
                    )
                    .padding()
                Text("You should have recieved\n a text with your code.")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Spacer()
                Spacer()
                //FIXME: This needs authentication & Disabled until user puts in correct SMS code 
                Button(action: {
                    print("FIXME")
                }) {
                    HStack {
                        Text("Continue")
                            .fontWeight(.semibold)
                            .font(.title)
//                        Spacer().frame(wid)
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
}


struct PhoneVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneVerificationView()
    }
}
