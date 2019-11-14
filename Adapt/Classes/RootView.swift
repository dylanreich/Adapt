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
    
    public var mainTabBarView: MainTabBarView!
    public var welcomeView = WelcomeView()
    
    init(userSettings: UserSettings, extraViewsForTab: [ViewWrapper]? = nil) {
        self.userSettings = userSettings
        self.mainTabBarView = MainTabBarView(extraViewsForTab: extraViewsForTab)
    }
    
    public var body: some View {
        Group {
            if userSettings.user != nil {
                mainTabBarView
            } else {
                welcomeView
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(userSettings: UserSettings())
    }
}
