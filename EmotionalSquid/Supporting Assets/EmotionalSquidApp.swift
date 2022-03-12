//
//  EmotionalSquidApp.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 1/23/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct EmotionalSquidApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
                NewUser()
        }
    }
}
