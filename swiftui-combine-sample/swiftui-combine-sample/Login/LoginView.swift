//
//  LoginView.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 10/11/24.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        ZStack {
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
                
                if let errorMessage = viewModel.loginErrorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.subheadline)
                        .padding(.horizontal, 20)
                }
                
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
                    viewModel.login()
                }) {
                    Text("Login")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.isLoginButtonEnabled ? Color.blue : Color.gray)
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                }
                .disabled(!viewModel.isLoginButtonEnabled)
                
                Text("OR")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Button(action: {
                    viewModel.loginAsGuest()
                }) {
                    Text("Enter as guest")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.teal)
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                }
                
                Spacer()
                Spacer()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
