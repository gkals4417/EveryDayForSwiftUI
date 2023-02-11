//
//  MainView.swift
//  EveryDayForSwiftUI
//
//  Created by Hamin Jeong on 2023/02/09.
//

import SwiftUI
import CoreData
import FSCalendar

class UserData: ObservableObject {
    @Published var date: Date?
}

struct MainView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SavedData.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<SavedData>
    
    @ObservedObject private var userDate = UserData()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                CalendarView(selectedData: $userDate.date)
                Spacer()
                List {
                    Group {
                        Text("Hello")
                        Text("HI")
                        Text("Hello")
                        Text("HI")
                        Text("Hello")
                        Text("HI")
                        Text("Hello")
                        Text("HI")
                        Text("Hello")
                        Text("HI")
                    }
                    Group {
                        Text("Hello")
                        Text("HI")
                        Text("Hello")
                        Text("HI")
                        Text("Hello")
                        Text("HI")
                        Text("Hello")
                        Text("HI")
                        Text("Hello")
                        Text("Last")
                    }
                }
                .listStyle(.inset)
                Spacer()
            }
            .toolbar {
                NavigationLink {
                    Text("HELLO")
                } label: {
                    Label("", systemImage: "plus")
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
