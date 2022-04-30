//
//  WidgetController.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 4/30/22.
//

import Foundation
import WidgetKit


struct WidgetController  {
    
    
    func didPressButton(SQUID_NAME: String) {
        let userDefault = UserDefaults(suiteName: "group.ESWidget")
        
        userDefault?.set(SQUID_NAME, forKey: "squidName")
        WidgetCenter.shared.reloadAllTimelines()
    }
}
