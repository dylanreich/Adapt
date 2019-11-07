//
//  CreateThreadView.swift
//  Adapt
//
//  Created by Dylan Reich on 11/6/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

struct CreateThreadView: View {
    @State private var title: String = ""
    @State private var message: String = ""
        
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(alignment: .center, spacing: nil) {
            Text("Create Thread").padding(100.0)
            VStack(alignment: .leading, spacing: 35) {
                TextField("Title", text: $title)
                TextField("Message", text: $message)
            }.padding(30.0)
            Spacer()
            Button("Continue") {
                self.createThread()
            }.padding(60.0)
        }
    }
    
    func createThread() {
        let thread = Thread(id: nil, title: title, subtitle: message, posts: [])
        API.sharedInstance.createThread(thread: thread) { (success, thread, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard success, let _ = thread else {
                print("error")
                return
            }
                        
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct CreateThreadView_Previews: PreviewProvider {
    static var previews: some View {
        CreateThreadView()
    }
}
