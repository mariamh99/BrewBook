//
//  BrewBookFinalApp.swift
//  BrewBookFinal
import SwiftUI
import Firebase
import FirebaseFirestore  // Ensure Firestore is imported

@main
struct BrewBookFinalApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(AuthenticationState())
                .environmentObject(UserViewModel())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        return true
    }
}
