//
//  ContentView.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 1/23/22.
//

import SwiftUI

struct NewUserLoginView: View {
    @State private var isShowingPhoneView = false
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .foregroundColor(.blue)
                
                Spacer()
                
                Text("FIX ME AT SOME POINT").padding()
                //FIXME: This is very broken, has two back buttons when it should only be one 
                NavigationLink(destination: OnBoardingView(), isActive: $isShowingPhoneView) { EmptyView() }
                Button(action: {
                    self.isShowingPhoneView = true
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
                    .frame(height: 20)
                
            }.navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

struct NewUserLoginView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserLoginView()
    }
}
