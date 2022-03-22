//
//  LogoutPopUp.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 3/21/22.
//
import SwiftUI

struct LogoutPopupView: View {
    
    @Binding var isPresented: Bool
    @State var text = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Button {
                    print("Image tapped!")
                } label: {
                    Text("Logout")
                }
            }
            Button {
                print("Image tapped!")
            } label: {
                Text("Logout")
            }
            Button {
                print("Image tapped!")
            } label: {
                Text("Logout")
            }
        }.padding()
        
    }
}


struct LogoutPopupView_Previews: PreviewProvider {
    static var previews: some View {
        LogoutPopupView(isPresented: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
