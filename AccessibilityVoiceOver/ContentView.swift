//
//  ContentView.swift
//  AccessibilityVoiceOver
//
//  Created by Fauzan Dwi Prasetyo on 13/07/23.
//

import SwiftUI

struct NamedView {
    var name: String
    var view: AnyView
    
    init<V>(_ name: String, view: V) where V: View {
        self.name = name
        self.view = AnyView(view)
    }
}

struct ContentView: View {
    private let topics = [
        NamedView("Identifying views with useful labels", view: IdentifyView()),
        NamedView("Hiding and grouping accessibility data", view: HideAndGroup()),
        NamedView("Reading the value of controls", view: ReadingValue())
    ]
    
    var body: some View {
        NavigationView {
            List(0..<topics.count, id: \.self) { i in
                NavigationLink {
                    topics[i].view
                } label: {
                    Text(topics[i].name)
                }
            }
            .navigationTitle("Accessibility")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
