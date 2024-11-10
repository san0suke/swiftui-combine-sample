//
//  StatusBarView.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 10/11/24.
//

import SwiftUI

struct StatusBarView: View {
    
    var body: some View {
        Text("Taps: 0")
            .font(.system(size: 16, weight: .medium))
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(8)
    }
}

#Preview {
    StatusBarView()
}
