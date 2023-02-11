//
//  ContentView.swift
//  EveryDayForSwiftUI
//
//  Created by Hamin Jeong on 2023/02/09.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("캘린더", systemImage: "calendar")
                }
            WordListView()
                .tabItem {
                    Label("단어목록", systemImage: "list.bullet")
                }
            QuestionView()
                .tabItem {
                    Label("문제풀기", systemImage: "questionmark.folder.fill")
                }
            InformationView()
                .tabItem {
                    Label("정보", systemImage: "info.circle")
                }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)

    }
}
