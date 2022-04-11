//
//  StoreView.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 2/25/22.
//

import SwiftUI

struct StoreView: View {
    @ObservedObject var storeController = InAppPurchases()
    var squid = [
        SquidModel(imageName: "HappySquid", color: "red",productID: "com.temporary.id.HappySquid"),
        SquidModel(imageName: "AngrySquid", color: "green", productID:  "com.temporary.id.AngrySquid"),
        SquidModel(imageName: "KingSquid", color: "blue", productID:  "com.temporary.id.KingSquid"),
    ]
    
    var body: some View {
        GeometryReader {geo in
            VStack {
                Spacer()
                    .frame(height: geo.size.height / 10)
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 50) {
                        ForEach(squid) { squid in
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
