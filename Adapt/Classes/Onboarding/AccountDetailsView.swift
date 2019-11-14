//
//  AccountDetailsView.swift
//  Adapt
//
//  Created by Dylan Reich on 11/6/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import SwiftUI

struct AccountDetailsView: View {
    @State private var user: User
    @State private var ageString: String
    
    var formattedNumber : Int? {
        //current workaround for issue using value/numberformatter textfield method
        let formatter = NumberFormatter()
        guard let number = formatter.number(from: String(self.ageString)) else {
            print("not valid to be converted")
            return nil
        }
        return number.intValue
    }
            
    init(createUser: Bool) {
        if !createUser, let user = AdaptLib.currentUser {
            _user = State(initialValue: user)
            _ageString = State(initialValue: String(user.age))
        } else {
            _user = State(initialValue: User(name: "", age: 0, bio: ""))
            _ageString = State(initialValue: String(""))
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: nil) {
            Text("Account Details").padding(100.0).font(Font.system(size: 22.0))
            VStack(alignment: .leading, spacing: 35) {
                TextField("Name", text: $user.name)
                TextField("Age", text: $ageString).keyboardType(.numberPad)
                TextField("Bio", text: $user.bio)
            }.padding(30.0)
            Spacer()
            Button(action: {
                guard self.user.name != "", let age = self.formattedNumber, self.user.bio != "" else {
                    print("error parsing text fields")
                    return
                }
                AdaptLib.signUp(user: User(name: self.user.name, age: age, bio: self.user.bio))
            }) {
                Text("Continue")
            }.padding(60.0)
        }
    }
}

struct AccountDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailsView(createUser: true)
    }
}
