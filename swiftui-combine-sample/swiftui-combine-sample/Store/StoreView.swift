//
//  StoreView.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 10/11/24.
//

import SwiftUI

struct StoreView: View {
    
    @ObservedObject var viewModel = StoreViewModel()
    private let itemList = StoreItemList()
    
    var body: some View {
        VStack(spacing: 0) {
            StatusBarView()
            
            List(itemList.items) { item in
//                StoreItemList(item: item, canBuy: viewModel.canBuy(item))
//                    .listRowBackground(Color.white)
            }
        }
    }
}

#Preview {
    StoreView()
}
