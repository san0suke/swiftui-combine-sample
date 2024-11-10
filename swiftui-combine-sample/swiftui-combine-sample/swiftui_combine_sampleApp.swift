//
//  swiftui_combine_sampleApp.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 09/11/24.
//

import SwiftUI

@main
struct swiftui_combine_sampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
