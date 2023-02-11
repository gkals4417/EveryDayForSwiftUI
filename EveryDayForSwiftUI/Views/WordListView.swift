//
//  WordListView.swift
//  EveryDayForSwiftUI
//
//  Created by Hamin Jeong on 2023/02/09.
//

import SwiftUI

struct WordListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SavedData.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<SavedData>
    
    var body: some View {
        Text("WordList View")
    }
}

struct WordListView_Previews: PreviewProvider {
    static var previews: some View {
        WordListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
