//
//  ChatView.swift
//  Adapt
//
//  Created by Dylan Reich on 11/12/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

struct ChatView: View {
    
    private var group: ChatGroup
    
    @State var showingReplyView = false
    
    init(group: ChatGroup) {
        self.group = group
    }
    
    var body: some View {
        List(group.messages) { (message) in
            ChatRow(message: message)
        }.navigationBarTitle(group.name)
        .sheet(isPresented: $showingReplyView) {
            CreateThreadView()
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView(group: ChatGroup(id: -1, name: "Chat Group", messages: [ChatMessage(id: -1, message: "Chat Message", isSender: false), ChatMessage(id: -2, message: "Chat Message", isSender: true)]))
        }
    }
}
