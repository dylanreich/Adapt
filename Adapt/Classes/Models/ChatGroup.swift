//
//  ChatGroup.swift
//  Adapt
//
//  Created by Dylan Reich on 11/12/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

struct ChatGroup: Codable, Identifiable {
    var id: Int?
    var name: String
    var messages: [ChatMessage]
}
