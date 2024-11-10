//
//  LoginViewModel.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 10/11/24.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var rememberMe: Bool = false
    
    @Published var isLoginButtonEnabled: Bool = false
    @Published var loginErrorMessage: String?
    @Published var isLoading: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        Publishers.CombineLatest($email, $password)
            .map { email, password in
                return !email.isEmpty && !password.isEmpty && email.contains("@")
            }
            .assign(to: &$isLoginButtonEnabled)
    }
    
    func login() {
        guard isLoginButtonEnabled else { return }
        
        isLoading = true
        loginErrorMessage = nil
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
            if self.email == "test@example.com" && self.password == "password" {
                // Login bem-sucedido
                print("Login successful")
            } else {
                // Falha no login
                self.loginErrorMessage = "Invalid email or password."
            }
        }
    }
    
    func loginAsGuest() {
        email = "guest@example.com"
        password = "guest"
    }
}