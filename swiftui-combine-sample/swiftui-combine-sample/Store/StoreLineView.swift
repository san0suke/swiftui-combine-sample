//
//  StoreLineView.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 10/11/24.
//

import SwiftUI

struct StoreLineView: View {
    
    let item: StoreItem
    let canBuy: Bool

    var body: some View {
        HStack {
            Image(systemName: item.iconName)
                .frame(width: 50, height: 50)
                .padding(.trailing)

            Text(item.name)
                .font(.headline)
            
            Spacer()
            
            Text("\(item.price) Taps")
                .font(.subheadline)
        }
        .background(Color.white)
        .opacity(canBuy ? 1.0 : 0.5)
        .disabled(!canBuy)
    }
}
