//
//  LoginViewModel.swift
//  swiftui-combine-sample
//
//  Created by Robson Cesar de Siqueira on 10/11/24.
//

import Foundation
import Combine
import Alamofire

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var rememberMe: Bool = false
    
    @Published var isLoginButtonEnabled: Bool = false
    @Published var loginErrorMessage: String?
    @Published var isLoading: Bool = false
    @Published var isLoggedIn: Bool = false
    
    private let networkManager: NetworkManager
    private var cancellables = Set<AnyCancellable>()
    private let userDefaultData: UserDefaultsData
    
    init(networkManager: NetworkManager = NetworkManager.shared,
         userDefaultData: UserDefaultsData = UserDefaultsData()) {
        self.networkManager = networkManager
        self.userDefaultData = userDefaultData
        
        Publishers.CombineLatest($email, $password)
            .map { email, password in
                return !email.isEmpty && !password.isEmpty && email.contains("@")
            }
            .assign(to: &$isLoginButtonEnabled)
        
        checkRememberMeData()
    }
    
    func checkRememberMeData() {
        isLoggedIn = userDefaultData.rememberMe
    }
    
    func login() {
        guard isLoginButtonEnabled else { return }
        
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        isLoading = true
        loginErrorMessage = nil
        
        networkManager.postRequest(url: "http://localhost:7071/api/LoginFunction", parameters: parameters) { (result: Result<LoginResponseDTO, AFError>) in
            self.isLoading = false
            
            switch result {
            case .success(let response):
                self.userDefaultData.userData = response
                self.userDefaultData.rememberMe = self.rememberMe
                self.isLoggedIn = true
            case .failure:
                self.loginErrorMessage = "Invalid email or password."
                self.isLoggedIn = false
            }
        }
    }
    
    func loginAsGuest() {
        self.userDefaultData.userData = nil
        self.userDefaultData.rememberMe = self.rememberMe
        
        self.isLoggedIn = true
    }
}
