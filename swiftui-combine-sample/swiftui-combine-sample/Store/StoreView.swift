//
//  StoreView.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 10/11/24.
//

import SwiftUI

struct StoreView: View {
    
    @ObservedObject var viewModel: StoreViewModel
    
    init(appManager: AppManager) {
        _viewModel = ObservedObject(wrappedValue: StoreViewModel(appManager: appManager))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            StatusBarView()
            
            List(viewModel.items) { item in
                StoreLineView(item: item, canBuy: viewModel.canBuy(item))
                    .onTapGesture {
                        viewModel.storeItemPressed(item)
                    }
                    .listRowBackground(Color.white)
            }
            .id(viewModel.reloadList)
        }
        .padding(.bottom)
    }
}

#Preview {
    StoreView(appManager: AppManager())
}
