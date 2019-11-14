//
//  Token.swift
//  Adapt
//
//  Created by Dylan Reich on 11/13/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

struct Token: Codable {
    var value: String
    
    init(value: String) {
        self.value = value
    }
}
