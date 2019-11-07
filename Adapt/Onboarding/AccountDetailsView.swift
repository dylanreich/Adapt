//
//  AccountDetailsView.swift
//  Adapt
//
//  Created by Dylan Reich on 11/6/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

struct AccountDetailsView: View {
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var bio: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: nil) {
            Text("Account Details").padding(100.0)
            VStack(alignment: .leading, spacing: 35) {
                TextField("Name", text: $name)
                TextField("Age", text: $age).keyboardType(.numberPad)
                TextField("Bio", text: $bio)
            }.padding(30.0)
            Spacer()
            NavigationLink(destination: MainThreadsView()) {
                Text("Continue")
            }.padding(60.0)
        }
    }
}

struct AccountDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailsView()
    }
}
