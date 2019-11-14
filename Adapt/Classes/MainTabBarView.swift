//
//  MainTabBarView.swift
//  Adapt
//
//  Created by Dylan Reich on 11/12/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

public struct MainTabBarView: View {
    public var tabView: some View {
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
            ForEach(0..<extraViewsForTab.count) { i in
              NavigationView {
                self.extraViewsForTab[i].view
              }
              .tabItem {
                  Image(systemName: "2.circle")
                  Text("\(i + MainTabBarView.numberOfBaseTabs)")
              }.tag(i + MainTabBarView.numberOfBaseTabs)
            }
        }
    }
    
    static let numberOfBaseTabs = 2
    
    var extraViewsForTab: [ViewWrapper]
    
    init(extraViewsForTab: [ViewWrapper]? = nil) {
        self.extraViewsForTab = extraViewsForTab ?? []
    }
    public var body: some View {
        tabView
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
