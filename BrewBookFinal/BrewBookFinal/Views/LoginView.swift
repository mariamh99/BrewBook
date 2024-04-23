//
//  LoginView.swift
//  BrewBookFinal
//
import SwiftUI

struct LoginView: View {
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
            
            Button("Login", action: attemptLogin)
                .buttonStyle(AppStyles.primaryButtonStyle)
                .padding(.top)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Login Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
        .padding()
    }
    
    private func attemptLogin() {
        authState.loginUser(email: email, password: password) { result in
            switch result {
            case .success(_):
                print("User logged in successfully")
            case .failure(let error):
                alertMessage = error.localizedDescription
                showAlert = true
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AuthenticationState())
    }
}
