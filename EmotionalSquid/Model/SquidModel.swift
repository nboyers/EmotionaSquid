//
//  SquidModel.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 2/20/22.
//

import Foundation


struct SquidModel: Identifiable, Codable {
    var id = UUID()
    let imageName: String
    let color: String
}


struct SQUID {
    let squid = [
        SquidModel(imageName: "kingsquid", color: "red"),
        SquidModel(imageName: "kingsquid", color: "green"),
        SquidModel(imageName: "kingsquid", color: "blue"),
        SquidModel(imageName: "kingsquid", color: "purple"),
    ]
}
