//
//  RoundedCornersShape.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 3/21/22.
//

import Foundation
import SwiftUI

struct RoundedCornersShape: Shape {
    
    let radius: CGFloat
    let corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
