//
//  HomeView.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 10/11/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedTab = 1

    var body: some View {
        TabView(selection: $selectedTab) {
            StoreView()
                .tabItem {
                    Label("Store", systemImage: "storefront")
                }
                .tag(0)

            LobbyView()
                .tabItem {
                    Label("Lobby", systemImage: "house")
                }
                .tag(1)
        }
        .onAppear {
//            viewModel.startTapFactory()
            selectedTab = 1
        }
    }
}

#Preview {
    HomeView()
}
