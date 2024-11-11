//
//  StoreView.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 10/11/24.
//

import SwiftUI

struct StoreView: View {
    
    @EnvironmentObject var appManager: AppManager
    @ObservedObject var viewModel = StoreViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            StatusBarView()
            
            List(viewModel.items) { item in
                StoreLineView(item: item, canBuy: viewModel.canBuy(item))
                    .listRowBackground(Color.white)
            }
        }
        .padding(.bottom)
        .onAppear {
            viewModel.appManager = appManager
        }
    }
}

#Preview {
    StoreView()
}
