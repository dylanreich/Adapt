//
//  PinEntryView.swift
//  Adapt
//
//  Created by Dylan Reich on 11/6/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

struct PinEntryView: View {
    private var phone: String = ""
    @State private var code: String = ""
    
    init(phone: String) {
        self.phone = phone
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: nil) {
            Text("Enter Code").padding(100.0)
            VStack(alignment: .leading, spacing: 35) {
                Text("Enter the code we sent to \(phone)")
                TextField("Pin Code", text: $code).keyboardType(.numberPad)
            }.padding(30.0)
            Spacer()
            NavigationLink(destination: SignUpView()) {
                Text("Continue")
            }.padding(60.0)
        }
    }
}

struct PinEntryView_Previews: PreviewProvider {
    static var previews: some View {
        PinEntryView(phone: "555-555-0123")
    }
}
