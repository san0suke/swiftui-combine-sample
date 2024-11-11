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
                .resizable()
                .frame(width: 40, height: 40)
                .padding()

            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("\(item.price) Taps")
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .opacity(canBuy ? 1.0 : 0.5)
        .disabled(!canBuy)
    }
}
