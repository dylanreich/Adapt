//
//  Adapt.swift
//  Adapt
//
//  Created by Dylan Reich on 11/5/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import UIKit
import SwiftUI

public final class AdaptLib {

    public static var sharedInstance: AdaptLib { //we do this so in case a user forgets to call initalize and tries to use the library, it will function normally
        get {
            if _sharedInstance == nil {
                _sharedInstance = AdaptLib()
            }
            return _sharedInstance
        }
        set {
            _sharedInstance = newValue
        }
    }
    
    static var _sharedInstance: AdaptLib!
    
    @Binding var userSettings: UserSettings
    
    static public var rootView: RootView {
        return sharedInstance.rootView
    }
        
    public var rootView: RootView!
    
    public static var currentUser: User? {
        return sharedInstance.userSettings.user
    }
    
    init(extraViewsForTab: [ViewWrapper]? = nil) {
        self._userSettings = Binding.constant(UserSettings())
        rootView = RootView(userSettings: userSettings, extraViewsForTab: extraViewsForTab)
    }
    
    
    
    static public func initalize(extraViewsForTab: [ViewWrapper]? = nil) {
        sharedInstance = AdaptLib(extraViewsForTab: extraViewsForTab)
    }
    
    static public func signUp(user: User) {
        sharedInstance.userSettings.user = user
    }
    
}
