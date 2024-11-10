//
//  LoginView.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 10/11/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("Welcome!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Email", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 20)
            
            SecureField("Password", text: $viewModel.password)
                .textContentType(.password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 20)
            
            HStack {
                Text("Remember me")
                    .font(.title3)
                
                Toggle(isOn: $viewModel.rememberMe) {
                    EmptyView()
                }
                .labelsHidden()
                .padding()
            }
            
            Button(action: {
                print("Login with email: \(viewModel.email), password: \(viewModel.password)")
            }) {
                Text("Login")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
            }
            
            Text("OR")
                .font(.title2)
                .fontWeight(.bold)
            
            Button(action: {
                print("Login as guest")
            }) {
                Text("Enter as guest")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
            }
            
            Spacer()
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
