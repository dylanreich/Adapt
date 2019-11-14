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
        NavigationView {
            VStack(alignment: .center, spacing: nil) {
                Spacer()
                Text("Welcome to Adapt").font(Font.system(.largeTitle))
                Spacer()
                HStack(alignment: .center, spacing: 30) {
                    NavigationLink(destination: EnterPhoneView(signIn: true)) {
                        Text("Login")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 100.0, height: 50.0)
                    }
                    .background(Color.blue)
                    NavigationLink(destination: EnterPhoneView(signIn: false)) {
                        Text("Sign Up")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 100.0, height: 50.0)
                    }
                    .background(Color.blue)
                }.padding(EdgeInsets(top: 0.0, leading: 0.0, bottom: 60.0, trailing: 0.0))
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
