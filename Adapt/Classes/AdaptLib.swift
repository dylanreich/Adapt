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

    public static let sharedInstance = AdaptLib()
    
    @Binding var userSettings: UserSettings
        
    public var rootView: RootView!
    
    public static var currentUser: User? {
        return sharedInstance.userSettings.user
    }
    
    init() {
        self._userSettings = Binding.constant(UserSettings())
        rootView = RootView(userSettings: userSettings)
    }
    
    static public func signUp(user: User) {
        sharedInstance.userSettings.user = user
    }
    
}
