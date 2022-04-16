//
//  StoreView.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 2/25/22.
//

import SwiftUI

struct StoreView: View {
    @ObservedObject var storeController = InAppPurchases()

    var body: some View {
        GeometryReader {geo in
            VStack {
                Spacer()
                    .frame(height: geo.size.height / 10)
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 50) {
                        ForEach(storeController.squid) { squid in
                            Button {
                                storeController.purchase()
                            } label: {
                                Image(squid.imageName)
                                    .resizable()
                                    .frame(width: geo.size.width / 4, height: geo.size.height / 8)
                            }
                        }
                    }
                }  .onAppear { storeController.fetchProducts() }
                
            }
            
        }
        
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
