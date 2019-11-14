//
//  Thread.swift
//  Adapt
//
//  Created by Dylan Reich on 11/6/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

struct Thread: Codable, Identifiable {
    var id: Int?
    var title: String
    var subtitle: String
    var posts: [Post]
}
