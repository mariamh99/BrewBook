// AuthenticationState.swift
import Combine
import SwiftUI

class AuthenticationState: ObservableObject {
    @Published var isAuthenticated = false
    @Published var user: User?
    
    func loginUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        AuthenticationManager.shared.loginUser(email: email, password: password) { result in
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                    self.user = user
                }
                completion(.success(user))
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isAuthenticated = false
                    self.user = nil
                }
                completion(.failure(error))
            }
        }
    }
    
    func logoutUser() {
        AuthenticationManager.shared.logoutUser()
        self.isAuthenticated = false
        self.user = nil
    }
}
