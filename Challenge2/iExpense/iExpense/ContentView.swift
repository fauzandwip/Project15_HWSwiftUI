//
//  ContentView.swift
//  iExpense
//
//  Created by Fauzan Dwi Prasetyo on 08/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                if !expenses.items.filter({ item in
                    item.type == "Personal"
                }).isEmpty {
                    // Personal Section
                    Section {
                        ForEach(expenses.items) { item in
                            if item.type == "Personal" {
                                ItemView(item: item)
                                // project 15 - Accessibility VoiceOver
                                    .accessibilityLabel("\(item.name), \(item.amount)")
                                    .accessibilityHint("Personal")
                            }
                        }
                        .onDelete(perform: removeItems)
                    } header: {
                        Text("Personal")
                    }
                }
                
                if !expenses.items.filter({ item in
                    item.type == "Business"
                }).isEmpty {
                    // Business Section
                    Section {
                        ForEach(expenses.items) { item in
                            if item.type == "Business" {
                                ItemView(item: item)
                                // project 15 - Accessibility VoiceOver
                                    .accessibilityLabel("\(item.name), \(item.amount)")
                                    .accessibilityHint("Business")
                            }
                        }
                        .onDelete(perform: removeItems)
                    } header: {
                        Text("Business")
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ItemView: View {
    var item: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }
            
            Spacer()
            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .foregroundColor(
                    item.amount >= 100 ? .red :
                        (item.amount >= 10 ? .orange : .green))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
