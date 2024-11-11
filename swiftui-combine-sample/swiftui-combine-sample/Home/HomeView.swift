//
//  HomeView.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 10/11/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 1
    @EnvironmentObject var appManager: AppManager

    var body: some View {
        TabView(selection: $selectedTab) {
            StoreView(appManager: appManager)
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
            selectedTab = 1
            appManager.startTapIncrementLoop()
        }
    }
}

#Preview {
    HomeView()
}
