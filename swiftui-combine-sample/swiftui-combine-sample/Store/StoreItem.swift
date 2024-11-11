//
//  StoreItem.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 10/11/24.
//

import Foundation

struct StoreItem: Identifiable {
    let id = UUID()
    let itemEnum: StoreItemEnum
    let iconName: String
    let price: Int
    let increaseTap: Int
    let increaseFactoryTap: Int
    
    var name: String {
        switch itemEnum {
        case .FisrtPlusTap, .SecondPlusTap, .ThirdPlusTap:
            return "+\(increaseTap) taps per tap"
        default:
            return "+\(increaseFactoryTap) taps/second tap factory"
        }
    }
}
