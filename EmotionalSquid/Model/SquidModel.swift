//
//  SquidModel.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 2/20/22.
//

import Foundation


struct SquidModel: Identifiable {
    var id = UUID()
    var imageName: String
    let color: String
    let productID: String
}


var squid = [
    SquidModel(imageName: "HappySquid", color: "red",productID: "com.temporary.id.HappySquid"),
    SquidModel(imageName: "AngrySquid", color: "green", productID:  "com.temporary.id.AngrySquid"),
    SquidModel(imageName: "KingSquid", color: "blue", productID:  "com.temporary.id.KingSquid"),
]
