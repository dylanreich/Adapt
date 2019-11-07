//
//  WelcomeView.swift
//  Adapt
//
//  Created by Dylan Reich on 11/6/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

public struct WelcomeView: View {
    public var body: some View {
        VStack(alignment: .center, spacing: nil) {
            Spacer()
            HStack(alignment: .center, spacing: 30) {
                NavigationLink(destination: LoginView()) {
                    Text("Log In")
                }
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                }
            }.padding(EdgeInsets(top: 0.0, leading: 0.0, bottom: 60.0, trailing: 0.0))
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
