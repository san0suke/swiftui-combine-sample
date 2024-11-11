//
//  StoreItemList.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 10/11/24.
//

import Foundation

class StoreItemList {
    
    let items: [StoreItem] = [
        StoreItem(itemEnum: .FisrtPlusTap, iconName: "hand.tap", price: 100, increaseTap: 3, increaseFactoryTap: 0),
        StoreItem(itemEnum: .FirstTapFactory, iconName: "person.3.sequence", price: 300, increaseTap: 0, increaseFactoryTap: 3),
        StoreItem(itemEnum: .SecondPlusTap, iconName: "hand.tap", price: 1000, increaseTap: 50, increaseFactoryTap: 0),
        StoreItem(itemEnum: .SecondTapFactory, iconName: "person.3.sequence", price: 10000, increaseTap: 0, increaseFactoryTap: 150),
        StoreItem(itemEnum: .ThirdPlusTap, iconName: "hand.tap", price: 100000, increaseTap: 1000, increaseFactoryTap: 0),
        StoreItem(itemEnum: .ThirdTapFactory, iconName: "person.3.sequence", price: 500000, increaseTap: 0, increaseFactoryTap: 10000),
        StoreItem(itemEnum: .Victory, iconName: "trophy", price: 1500000, increaseTap: 0, increaseFactoryTap: 0),
    ]
}
