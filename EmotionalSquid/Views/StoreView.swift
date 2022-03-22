//
//  StoreView.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 2/25/22.
//

import SwiftUI

struct StoreView: View {    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer().frame(height: geo.size.height / 10)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<10) {_ in
                            Button(action: {
                                //FIXME: Make this do something
                            }) {
                                Image(systemName: "lock.fill")
                                    .resizable()
                                    .frame(width: geo.size.width / 6, height: geo.size.height / 8)
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
            }
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
