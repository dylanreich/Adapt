//
//  ThreadView.swift
//  Adapt
//
//  Created by Dylan Reich on 11/6/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

struct ThreadView: View {
    @State private var threads: [Thread] = []
    
    private var thread: Thread
    
    init(thread: Thread) {
        self.thread = thread
    }
    
    var body: some View {
        List(threads) { (thread) in
            NavigationLink(destination: AccountDetailsView()) {
                ThreadListRowView(thread: thread)
            }
            }.navigationBarTitle("Thread")
    }
}

struct ThreadView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadView(thread: Thread(id: -1, title: "Main Thread", subtitle: "Main Thread Description"))
    }
}
