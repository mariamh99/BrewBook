//
//  SignUpView.swift
//  BrewBookFinal
//
import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var authState: AuthenticationState
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Sign Up", action: performRegistration)
                .buttonStyle(AppStyles.primaryButtonStyle)
                .padding(.top)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Sign Up Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
        .padding()
    }
    
    private func performRegistration() {
        AuthenticationManager.shared.registerUser(email: email, password: password) { result in
            switch result {
            case .success(let user):
                print("User registered successfully: \(user)")
                authState.isAuthenticated = true
            case .failure(let error):
                alertMessage = error.localizedDescription
                showAlert = true
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().environmentObject(AuthenticationState())
    }
}
