//
//  ContentView.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 09/11/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var loginViewModel = LoginViewModel()
    @StateObject private var appManager = AppManager()

    var body: some View {
        NavigationView {
            if loginViewModel.isLoggedIn {
                HomeView()
                    .environmentObject(appManager)
            } else {
                LoginView(viewModel: loginViewModel)
            }
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
