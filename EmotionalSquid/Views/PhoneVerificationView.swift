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
        VStack(alignment: .center) {
            Spacer()
            Text("What's your phone number?")
                .font(.title)
                .fontWeight(.heavy)
           
            TextField("Phone number", text: $phoneNumber)
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
            Text("You should recieve a text\n mesage with your code.")
                .font(.subheadline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Spacer()
            Spacer()
            Button(action: {
                print("FIXME")
            }) {
                HStack {
//                    Image(systemName: "person.fill")
//                        .font(.title)
                    Text("Continue :D")
                        .fontWeight(.semibold)
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


struct PhoneVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneVerificationView()
    }
}
