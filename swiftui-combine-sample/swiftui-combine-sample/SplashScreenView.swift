//
//  SplashScreenView.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 10/11/24.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        GeometryReader { geometry in
            Image("taptap")
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SplashScreenView()
}
