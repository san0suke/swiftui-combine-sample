//
//  LoadingView.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 10/11/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            ProgressView("Loading...")
                .foregroundColor(.white)
                .padding()
                .background(Color.gray.opacity(0.8))
                .cornerRadius(10)
        }
    }
}
