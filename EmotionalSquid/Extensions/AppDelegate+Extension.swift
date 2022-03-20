//
//  AppDelegate+Extension.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 3/19/22.
//

import SwiftUI
import UIKit
import Firebase
import FirebaseMessaging

// MARK: -cloud messaging
extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        // this always gets called correctly
        print("Firebase registration token: \(String(describing: fcmToken))")
        // checking if the token is new and needs to be updated in db
    }
    
}
