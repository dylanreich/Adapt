//
//  Post.swift
//  Adapt
//
//  Created by Dylan Reich on 11/7/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

struct Post: Codable, Identifiable {
    var id: Int?
    var headline: String
    var message: String
}
