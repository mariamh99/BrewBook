//
//  AuthenticationView.swift
//  BrewBookFinal
//
import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Button {
                    
                }
            label:
                {
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                
                Button {
                    
                }
            label:{
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            }
            .padding()
            .background(AppStyles.backgroundColor)
            .navigationBarTitle("Welcome", displayMode: .automatic)
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
