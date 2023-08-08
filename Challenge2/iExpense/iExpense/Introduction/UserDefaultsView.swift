//
//  UserDefaultsView.swift
//  iExpense
//
//  Created by Fauzan Dwi Prasetyo on 08/06/23.
//

import SwiftUI

struct UserDefaultsView: View {
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
//            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

struct UserDefaultsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsView()
    }
}

struct UserArchive: Codable {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct ArchivingDataView: View {
    @State private var user = UserArchive(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save Data") {
            let jsonEncoder = JSONEncoder()
            
            if let data = try? jsonEncoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
        
        Button("Load Data") {
            if let userData = UserDefaults.standard.object(forKey: "UserData") as? Data {
                let jsonEncoder = JSONDecoder()
                
                if let data = try? jsonEncoder.decode(UserArchive.self, from: userData) {
                    user = data
                }
            }
        }
    }
}
