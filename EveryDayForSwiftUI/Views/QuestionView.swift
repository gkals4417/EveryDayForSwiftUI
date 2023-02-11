//
//  QuestionView.swift
//  EveryDayForSwiftUI
//
//  Created by Hamin Jeong on 2023/02/09.
//

import SwiftUI

struct QuestionView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SavedData.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<SavedData>
    
    var body: some View {
        Text("Question View")
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
