//
//  MainTabBarView.swift
//  Adapt
//
//  Created by Dylan Reich on 11/12/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

struct MainTabBarView: View {
    var body: some View {
        TabView {
            NavigationView {
                MainThreadsView()
            }
            .tabItem {
                Image(systemName: "1.circle")
                Text("First")
            }.tag(0)
            NavigationView {
                ChatView(group: ChatGroup(id: -1, name: "Chat Group", messages: [ChatMessage(id: -1, message: "Chat Message", isSender: false), ChatMessage(id: -2, message: "Chat Message", isSender: true)]))
            }
            .tabItem {
                Image(systemName: "2.circle")
                Text("Second")
            }.tag(1)
        }
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
