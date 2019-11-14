//
//  RootView.swift
//  Adapt
//
//  Created by Dylan Reich on 11/13/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

public struct RootView: View {
    
    @ObservedObject var userSettings: UserSettings
    
    public var body: some View {
        Group {
            if userSettings.user != nil {
                MainTabBarView()
            } else {
                WelcomeView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(userSettings: UserSettings())
    }
}
