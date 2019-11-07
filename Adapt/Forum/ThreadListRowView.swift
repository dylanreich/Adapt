//
//  ThreadListRowView.swift
//  Adapt
//
//  Created by Dylan Reich on 11/6/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

struct ThreadListRowView: View {
    var thread: Thread

    var body: some View {
        VStack(alignment: .leading, spacing: nil) {
            Text(thread.title)
            Text(thread.subtitle)
        }
    }
}

struct ThreadListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadListRowView(thread: Thread(id: -1, title: "Main Thread", subtitle: "Main Thread Description"))
    }
}
