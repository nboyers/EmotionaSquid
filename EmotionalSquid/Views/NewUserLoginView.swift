//
//  ContentView.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 1/23/22.
//

import SwiftUI

struct NewUserLoginView: View {
    var body: some View {
        
        VStack {
            Spacer()
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 250, height: 250)
                .foregroundColor(.blue)
            
            Spacer()
            
            Text("FIX ME AT SOME POINT").padding()
            Button(action: {
                print("Delete tapped!")
            }) {
                HStack {
                    Image(systemName: "person.fill")
                        .font(.title)
                    Text("Sign Up")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(40)
                .padding(.horizontal, 20)
            }
            Spacer().frame(height: 20)
           
        }
    }
}

struct NewUserLoginView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserLoginView()
    }
}
