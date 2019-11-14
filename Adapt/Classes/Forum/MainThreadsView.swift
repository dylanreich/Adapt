//
//  MainThreadsView.swift
//  Adapt
//
//  Created by Dylan Reich on 11/6/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

struct MainThreadsView: View {
    @State private var threads: [Thread] = [Thread(id: -1, title: "New Cars", subtitle: "Thread Description", posts: [Post(id: -1, headline: "Check This Out", message: "I got this new lambo and it was fire bro! But what I really want is that flying Tesla."), Post(id: -2, headline: "Check This Out", message: "I don't like combustion vehicles.")])]
    
    @State var showingAccount = false
    @State var showingCreateThread = false
        
    var body: some View {
        List(threads) { (thread) in
            NavigationLink(destination: ThreadView(thread: thread)) {
                ThreadListRowView(thread: thread)
            }
        }
        .navigationBarTitle("Threads").navigationBarItems(leading: accountItem.sheet(isPresented: $showingAccount) {
            AccountDetailsView(createUser: false)
        }, trailing: createThreadItem.sheet(isPresented: $showingCreateThread) {
            CreateThreadView()
        })
        .onAppear {
            UITableView.appearance().separatorStyle = .singleLine
            UITableView.appearance().tableFooterView = UIView()
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
