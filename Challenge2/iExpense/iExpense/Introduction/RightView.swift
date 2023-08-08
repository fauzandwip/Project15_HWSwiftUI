//
//  RightView.swift
//  iExpense
//
//  Created by Fauzan Dwi Prasetyo on 08/06/23.
//

import SwiftUI

class SecondUser: ObservableObject {
    // publishes change announcements automatically.
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct RightView: View {
    // watches for those announcements and refreshes any views using the object.
    @StateObject var user = SecondUser()
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("RightView")
                Text("Your name is \(user.firstName) \(user.lastName)")
                
                TextField("First name", text: $user.firstName)
                TextField("Last name", text: $user.lastName)
                
                Button("Second View") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    SecondRightView(user: user)
                }
            }
        }
    }
}

struct SecondRightView: View {
    @StateObject var user: SecondUser
    
    var body: some View {
        VStack {
            Text("SecondRightView")
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

struct RightView_Previews: PreviewProvider {
    static var previews: some View {
        RightView()
    }
}
