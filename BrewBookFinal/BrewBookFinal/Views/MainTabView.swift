//
//  MainTabView.swift
//  BrewBookFinal
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            BookingsView()
                .tabItem {
                    Label("Bookings", systemImage: "calendar")
                }
            CafeListView()
                .tabItem {
                    Label("Cafes", systemImage: "cup.and.saucer")
                }
            UserProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .environmentObject(UserViewModel())  // Ensuring UserViewModel is available in all tabs
        .accentColor(.blue)
    }
}
