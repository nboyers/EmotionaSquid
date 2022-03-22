//
//  BottomPopupView.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 3/21/22.
//

import SwiftUI
//
//  Created by Artem Novichkov on 20.05.2021.
//

import SwiftUI

struct BottomPopupView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                content
                    .padding(.bottom, geometry.safeAreaInsets.bottom)
                    .background(Color.white)
                    .cornerRadius(radius: 16, corners: [.topLeft, .topRight])
            }
            .edgesIgnoringSafeArea([.bottom])
        }
        .animation(Animation.easeOut)
        .transition(.move(edge: .bottom))
    }
}
