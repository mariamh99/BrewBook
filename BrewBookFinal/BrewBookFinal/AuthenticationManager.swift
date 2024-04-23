//
//  AuthenticationManager.swift
//  BrewBookFinal

import Firebase

class AuthenticationManager {
    static let shared = AuthenticationManager()

    private init() {}

    // Function to register a new user with Firebase Authentication
    func registerUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let firebaseUser = authResult?.user {
                // Simplified User structure: Only ID and email are now stored
                let user = User(id: firebaseUser.uid, email: email)
                completion(.success(user))
            }
        }
    }
    
    // Function to log in a user with Firebase Authentication
    func loginUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let firebaseUser = authResult?.user {
                // Simplified User structure: Only ID and email are now stored
                let user = User(id: firebaseUser.uid, email: email)
                completion(.success(user))
            }
        }
    }

    // Function to log out the current user
    func logoutUser() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
