//
//  ChatRow.swift
//  Adapt
//
//  Created by Dylan Reich on 11/12/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

struct ChatRow: View {
    
    var message: ChatMessage
    
    init(message: ChatMessage) {
        self.message = message
    }
    
    var body: some View {
        Group {
            if !message.isSender {
                HStack {
                    Group {
                        Image(systemName: "person.crop.circle").font(.title)
                        Text(message.message)
                            .bold()
                            .padding(10)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            } else {
                HStack {
                    Group {
                        Spacer()
                        Text(message.message)
                            .bold()
                            .foregroundColor(Color.white)
                            .padding(10)
                            .background(Color.red)
                        .cornerRadius(10)
                        Image(systemName: "person.crop.circle").font(.title)
                    }
                }
            }
        }
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(message: ChatMessage(id: -1, message: "Chat Message", isSender: true))
    }
}
