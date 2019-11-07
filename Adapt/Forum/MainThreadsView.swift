//
//  MainThreadsView.swift
//  Adapt
//
//  Created by Dylan Reich on 11/6/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

struct MainThreadsView: View {
    @State private var threads: [Thread] = []
    
    var title: String = "Threads"
    
    var body: some View {
        List(threads) { (thread) in
            NavigationLink(destination: AccountDetailsView()) {
                ThreadListRowView(thread: thread)
            }
        }.navigationBarTitle("Threads")
    }
}

struct MainThreadsView_Previews: PreviewProvider {
    static var previews: some View {
        MainThreadsView()
    }
}
