//
//  EveryDayForSwiftUIApp.swift
//  EveryDayForSwiftUI
//
//  Created by Hamin Jeong on 2023/02/09.
//

import SwiftUI

@main
struct EveryDayForSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
