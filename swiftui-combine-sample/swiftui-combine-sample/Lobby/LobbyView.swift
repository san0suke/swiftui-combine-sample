//
//  LobbyView.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 10/11/24.
//

import SwiftUI

struct LobbyView: View {
    
    var body: some View {
        VStack {
            StatusBarView()
            
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .border(Color.black, width: 2)
//                    .onTapGesture {
//                        tapCountManager.incrementTap()
//                    }

                Text("Tap me!")
                    .font(.system(size: 32, weight: .bold))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    LobbyView()
}
