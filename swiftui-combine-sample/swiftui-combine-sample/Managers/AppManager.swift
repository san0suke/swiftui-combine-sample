//
//  AppManager.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 10/11/24.
//

import Foundation

fileprivate let tapCountKey = "tapCountKey"
fileprivate let increasePerTapKey = "increasePerTap"
fileprivate let factoryIncreaseTapKey = "factoryIncreaseTap"

class AppManager: ObservableObject {
    
    @Published var tapCount: Int
    
    private var timer: Timer?
    
    var increasePerTap: Int
    var factoryIncreaseTap: Int
    
    init(tapCount: Int = UserDefaults.standard.integer(forKey: tapCountKey),
         timer: Timer? = nil,
         increasePerTap: Int = UserDefaults.standard.integer(forKey: increasePerTapKey),
         factoryIncreaseTap: Int = UserDefaults.standard.integer(forKey: factoryIncreaseTapKey)) {
        self.tapCount = tapCount
        self.timer = timer
        self.increasePerTap = increasePerTap == 0 ? 1 : increasePerTap
        self.factoryIncreaseTap = factoryIncreaseTap
    }
    
    func incrementTap() {
        tapCount += increasePerTap
        saveTapCount()
    }
    
    @objc func factoryTapIncrease() {
        tapCount += factoryIncreaseTap
        saveTapCount()
    }
    
    func startTapIncrementLoop() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(factoryTapIncrease), userInfo: nil, repeats: true)
    }
    
    func stopTapIncrementLoop() {
        timer?.invalidate()
        timer = nil
    }
    
    private func saveTapCount() {
        UserDefaults.standard.set(tapCount, forKey: tapCountKey)
    }
}
