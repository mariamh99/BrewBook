//
//  SplashScreenView.swift
//  BrewBookFinal
//
import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject var authState: AuthenticationState
    @State private var isActive = false
    @State private var loadingText = "Loading"

    var body: some View {
        VStack {
            if isActive {
                if authState.isAuthenticated {
                    MainTabView()
                } else {
                    AuthenticationView()
                }
            } else {
                Image("SplashScreen")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(loadingText)
                    .font(.headline)
                    .padding()
            }
        }
        .onAppear {
            startLoadingAnimation()
        }
    }

    private func startLoadingAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            withAnimation {
                loadingText = loadingText.count < 11 ? (loadingText + ".") : "Loading"
                if loadingText == "Loading..." {
                    timer.invalidate()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView().environmentObject(AuthenticationState())
            .environmentObject(UserViewModel())  
    }
}
