//
//  ContentView.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 2/13/22.
//

import SwiftUI
struct View2: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack {
            Button(action: {
              //  self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("POP")
            }
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: View2()) {
                Text("PUSH")
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
