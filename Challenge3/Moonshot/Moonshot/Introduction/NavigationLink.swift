//
//  NavigationLink.swift
//  Moonshot
//
//  Created by Fauzan Dwi Prasetyo on 09/06/23.
//

import SwiftUI

// MARK: - Difference between NavigationLink and .sheet()
//NavigationLink is for showing details about the user’s selection, like you’re digging deeper into a topic.
//sheet() is for showing unrelated content, such as settings or a compose window.

struct NavLinkView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail \(row)")
                } label: {
                    Text("Row \(row)")
                }
            }
        }
    }
}

struct NavLinkView_Previews: PreviewProvider {
    static var previews: some View {
        NavLinkView()
    }
}
