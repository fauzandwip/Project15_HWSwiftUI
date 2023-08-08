//
//  FirstView.swift
//  iExpense
//
//  Created by Fauzan Dwi Prasetyo on 08/06/23.
//

import SwiftUI

struct User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct FirstView: View {
    @State private var user = User()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("FirstView")
                Text("Your name is \(user.firstName) \(user.lastName)")
                
                TextField("First name", text: $user.firstName)
                TextField("Last name", text: $user.lastName)
                
                NavigationLink {
                    SecondFirstView(user: user)
                } label: {
                    Text("Second Content")
                }
            }
        }
    }
}


// in FirstView, the firstName not changed. While firstName in SecondFirstView changed
// while back to FirstView and go to SecondFirstView, the firstName same with FirstView
// because use struct

struct SecondFirstView: View {
    @State var user: User
    
    var body: some View {
        VStack {
            Text("SecondFirstView")
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
