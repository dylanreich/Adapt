//
//  ChatMessage.swift
//  Adapt
//
//  Created by Dylan Reich on 11/12/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

struct ChatMessage: Codable, Identifiable {
    var id: Int?
    var message: String
    var isSender: Bool
}
