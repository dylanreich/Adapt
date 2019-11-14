//
//  EnterPhoneView.swift
//  Adapt
//
//  Created by Dylan Reich on 11/6/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

struct EnterPhoneView: View {
    @State private var phone: String = ""
    @State private var headerText: String
    
    init(signIn: Bool) {
        _headerText = State(initialValue: signIn ? "Sign In" : "Sign Up")
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: nil) {
            Text(headerText).padding(100.0).font(Font.system(size: 22.0))
            VStack(alignment: .leading, spacing: 35) {
                Text("Let's get started... Enter your phone number below and we'll text you a code.")
                TextField("Phone", text: $phone).keyboardType(.numberPad)
            }.padding(30.0)
            Spacer()
            NavigationLink(destination: PinEntryView(phone: phone)) {
                Text("Continue")
            }.padding(60.0)
        }
    }
}

struct EnterPhoneView_Previews: PreviewProvider {
    static var previews: some View {
        EnterPhoneView(signIn: false)
    }
}
