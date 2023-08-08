//
//  Expenses.swift
//  iExpense
//
//  Created by Fauzan Dwi Prasetyo on 08/06/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            do {
                let encoded = try JSONEncoder().encode(items)
                UserDefaults.standard.set(encoded, forKey: "Items")
            } catch {
                print("Error while encoded item, \(error)")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            do {
                let decodedItems = try JSONDecoder().decode([ExpenseItem].self, from: savedItems)
                items = decodedItems
            } catch {
                items = []
            }
        }
    }
}
