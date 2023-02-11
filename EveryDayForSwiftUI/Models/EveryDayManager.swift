//
//  EveryDayManager.swift
//  EveryDayForSwiftUI
//
//  Created by Hamin Jeong on 2023/02/09.
//

import SwiftUI
import CoreData

class EveryDayManager: ObservableObject {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SavedData.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<SavedData>
    
    @Published var word: String = ""
    @Published var mean: String = ""
    @Published var memo: String = ""
    @Published var wordClass: [String] = []
    @Published var date: Date?
    
    
    func addItem(word: String, mean: String, memo: String, workdClass: [String]) {
        withAnimation {
            let newItem = SavedData(context: viewContext)
            newItem.timestamp = Date()
            newItem.word = word
            newItem.mean = mean
            newItem.memo = memo
            newItem.wordClass = wordClass
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    
    
}
