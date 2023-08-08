//
//  ShowAndHideView.swift
//  iExpense
//
//  Created by Fauzan Dwi Prasetyo on 08/06/23.
//

import SwiftUI

struct ShowHideView: View {
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack {
            Button("Second View") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: "patito")
            }
        }
    }
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
        
        Text("Hello, \(name)")
    }
}

struct ShowHide_Previews: PreviewProvider {
    static var previews: some View {
        ShowHideView()
    }
}

