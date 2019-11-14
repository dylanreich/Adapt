//
//  ViewWrapper.swift
//  Adapt
//
//  Created by Dylan Reich on 11/14/19.
//

import SwiftUI

public struct ViewWrapper: Identifiable {
    public var id: Int?
    
    public var view: AnyView
    
    public init(view: AnyView) {
        self.view = view
    }
}
