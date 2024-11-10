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
    
    private let networkManager: NetworkManager
    private var cancellables = Set<AnyCancellable>()
    private let userDefaultData: UserDefaultsData
    
    init(networkManager: NetworkManager = NetworkManager.shared,
         userDefaultData: UserDefaultsData = UserDefaultsData()) {
        self.networkManager = networkManager
        self.userDefaultData = userDefaultData
        
        email = "newuser2@domain.com"
        password = "password1234"
//        password = "password12346" //wrong password
        
        Publishers.CombineLatest($email, $password)
            .map { email, password in
                return !email.isEmpty && !password.isEmpty && email.contains("@")
            }
            .assign(to: &$isLoginButtonEnabled)
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
            
            self.userDefaultData.userData = try? result.get()
            self.userDefaultData.rememberMe = self.rememberMe
        }
    }
    
    func loginAsGuest() {
        email = "guest@example.com"
        password = "guest"
    }
}
