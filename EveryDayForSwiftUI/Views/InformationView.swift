//
//  InformationView.swift
//  EveryDayForSwiftUI
//
//  Created by Hamin Jeong on 2023/02/09.
//

import SwiftUI

struct InformationView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SavedData.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<SavedData>
    
    var body: some View {
        Text("Information View")
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
