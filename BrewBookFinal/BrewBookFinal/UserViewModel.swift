//
//  UserViewModel.swift
//  BrewBookFinal
//
import Foundation
import Combine
import FirebaseFirestore
import FirebaseAuth

class UserViewModel: ObservableObject {
    @Published var user: User?
    private var db = Firestore.firestore()
    
    init() {
        fetchUser()
    }

    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("No logged-in user")
            return
        }
        db.collection("users").document(userId).getDocument { (document, error) in
            if let document = document, document.exists {
                do {
                    let userData = try document.data(as: User.self)
                    DispatchQueue.main.async {
                        self.user = userData
                        print("User fetched successfully: \(self.user?.email ?? "")")
                    }
                } catch {
                    print("Error decoding user: \(error)")
                }
            } else {
                print("Document does not exist")
            }
        }
    }

    func updateUser(_ user: User) {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("No logged-in user")
            return
        }
        do {
            try db.collection("users").document(userId).setData(from: user)
            DispatchQueue.main.async {
                self.user = user
                print("User updated and saved to Firestore: \(user.email)")
            }
        } catch {
            print("Error updating user: \(error)")
        }
    }
}
