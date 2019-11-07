//
//  ThreadView.swift
//  Adapt
//
//  Created by Dylan Reich on 11/6/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

struct ThreadView: View {
    
    private var thread: Thread
    
    @State var showingReplyView = false
    
    init(thread: Thread) {
        self.thread = thread
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: nil) {
            List(thread.posts) { (post) in
                NavigationLink(destination: AccountDetailsView()) {
                    ThreadRowView(post: post)
                }
            }.navigationBarTitle(thread.title)
            .sheet(isPresented: $showingReplyView) {
                CreateThreadView()
            }
            Spacer()
            NavigationLink(destination: CreateThreadView()) {
                Text("Reply")
            }.padding(30.0)
        }
    }
}

struct ThreadView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ThreadView(thread: Thread(id: -1, title: "New Cars", subtitle: "Thread Description", posts: [Post(id: -1, headline: "Check This Out", message: "I got this new lambo and it was fire bro! But what I really want is that flying Tesla."), Post(id: -2, headline: "Check This Out", message: "I don't like combustion vehicles.")]))
        }
    }
}
