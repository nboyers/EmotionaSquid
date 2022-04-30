//
//  SquidView.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 2/7/22.
//

import SwiftUI

struct SquidView: View {
    var body: some View {
        VStack {
            SocialSign()
            SquidChoice()
            ColorSelectionWheel()
            Store()
        }
    }
}

struct SocialSign: View {
    @State private var logoutPopup = false
    @State private var willViewSocialView = false
    var body: some View {
        GeometryReader { geo in
            HStack(alignment: .center) {
                Spacer()
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
                Spacer().frame(width:geo.size.width / 10)
            }
            .sheet(isPresented: $willViewSocialView){ FriendProfiles() }
        }
    }
}

struct SquidChoice: View {
    @StateObject var storeController = InAppPurchases()
    private let Widget = WidgetController()
    @State var sendSquid = false
    @ViewBuilder private var lockedImageOverlay: some View {
        GeometryReader { geo in
            if !storeController.squid.isEmpty {
                Image(systemName: "lock.rectangle")
                    .resizable()
                    .padding()
                    .offset(x: geo.size.width * 0.25, y: geo.size.width * 0.2)
                    .foregroundColor(Color.accentRed)
                    .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.5)
            }
        }
    }
    
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 25) {
                    ForEach(storeController.squid) { squid in
                        Button {
                            Widget.didPressButton(SQUID_NAME: squid.imageName)
                        } label: {
                            Image(squid.imageName)
                                .resizable()
                                .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.75)
                        }  //.overlay(lockedImageOverlay)
                    }
                }
            }  .onAppear { storeController.fetchProducts() }
        }
    }
}

struct Lock: View {
    var body: some View {
        GeometryReader { geo in
            Image(systemName: "lock.fill")
                .resizable()
                .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.75, alignment: .center)
        }
    }
}

struct ColorSelectionWheel: View {
    var body: some View {
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
    }
}
struct Store: View {
    @State private var showStore = false
    var body: some View {
        Group {
            Button("More Squids") {
                showStore.toggle()
            }
            .font(.title3)
            .buttonStyle(GrowingButton())
            .sheet(isPresented: $showStore) {
                StoreView()
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

struct SquidView_Previews: PreviewProvider {
    static var previews: some View {
        SquidView()
    }
}
