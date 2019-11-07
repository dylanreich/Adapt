//
//  ThreadRowView.swift
//  Adapt
//
//  Created by Dylan Reich on 11/7/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

struct ThreadRowView: View {
    
    var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    var body: some View {
        Text(post.message)
    }
}

struct ThreadRowView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadRowView(post: Post(id: -1, headline: "Check This Out", message: "I got this new lambo and it was fire bro!"))
    }
}
