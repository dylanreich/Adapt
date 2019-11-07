//
//  MainThreadsView.swift
//  Adapt
//
//  Created by Dylan Reich on 11/6/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

struct MainThreadsView: View {
    @State private var threads: [Thread] = [Thread(id: -1, title: "Thread Name", subtitle: "Thread Description", posts: [])]
    
    @State var showingAccount = false
    @State var showingCreateThread = false
        
    var body: some View {
        List(threads) { (thread) in
            NavigationLink(destination: ThreadView(thread: thread)) {
                ThreadListRowView(thread: thread)
            }
        }
        .navigationBarTitle("Threads").navigationBarItems(leading: accountItem, trailing: createThreadItem)
        .sheet(isPresented: $showingAccount) {
                AccountDetailsView()
            }
        .sheet(isPresented: $showingCreateThread) {
                CreateThreadView()
            }
    }
    
    var accountItem: some View {
        Image(systemName: "person.crop.circle").font(.title).onTapGesture {
            self.showingAccount = true
        }
    }
    
    var createThreadItem: some View {
        Image(systemName: "plus").font(.title).onTapGesture {
            self.showingCreateThread = true
        }
    }
}

struct MainThreadsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainThreadsView()
        }
    }
}
