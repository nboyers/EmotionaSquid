//
//  SquidView.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 2/7/22.
//

import SwiftUI

struct SquidView: View {
    @State private var willViewSocialView = false
    @State private var  showStore = false
    @State private var logoutPopup = false
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack(alignment: .center) {
                    
                    Button(action: {
                        willViewSocialView.toggle()
                    }) {
                        Image(systemName: "person.2.fill")
                    }
                    .frame(maxWidth: 10, maxHeight: 10)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(40)
                    
                    Spacer().frame(width: geo.size.width * 0.6)
                    
                    Button(action: {
                        self.logoutPopup.toggle()
                    }) {
                        Image(systemName: "person.fill")
                    }
                    .frame(maxWidth: 10, maxHeight: 10)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(40)
                    
                }
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<10) {_ in
                            Button(action: {
                                //FIXME: Make this send to other user
                            }) {
                                Image(systemName: "airpods.gen3")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                            }
                            .frame(width: 200, height: 200)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .cornerRadius(100)
                        }
                    }
                }
                
                Spacer().frame(height: 75)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<10) {_ in
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.teal)
                        }
                    }
                }
                
                Spacer()
                Button("More Squids") {
                    showStore.toggle()
                }
                .font(.title3)
                .buttonStyle(GrowingButton())
                .sheet(isPresented: $showStore) {
                    StoreView()
                }
                .sheet(isPresented: $willViewSocialView){
                    FriendProfiles()
                }
                Image(systemName: "arrow.down")
                    .renderingMode(.original)
                    .resizable()
                    .foregroundColor(Color.gray)
                    .frame(width: 30.0, height: 30.0)
            }
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

struct SquidView_Previews: PreviewProvider {
    static var previews: some View {
        SquidView()
    }
}
