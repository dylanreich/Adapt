//
//  User.swift
//  Adapt
//
//  Created by Dylan Reich on 11/13/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

public struct User: Codable, Identifiable {
    public var id: Int?
    public var name: String
    public var age: Int
    public var bio: String
    
    init(name: String, age: Int, bio: String) {
        self.name = name
        self.age = age
        self.bio = bio
    }
}

class UserSettings: ObservableObject {
    @Published var user: User?
}
