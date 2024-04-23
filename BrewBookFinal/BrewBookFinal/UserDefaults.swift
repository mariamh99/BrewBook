//
//  UserDefaults.swift
//  BrewBookFinal
import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let defaults = UserDefaults.standard
    
    private enum Keys {
        static let currentUser = "currentUser"
        static let isNotificationEnabled = "isNotificationEnabled"
        static let defaultLocation = "defaultLocation"
    }

    // User data management
    func saveUser(_ user: User) {
        do {
            let data = try JSONEncoder().encode(user)
            defaults.set(data, forKey: Keys.currentUser)
            print("User saved successfully in UserDefaults.")
        } catch {
            print("Failed to save user in UserDefaults: \(error)")
        }
    }

    func loadUser() -> User? {
        guard let userData = defaults.data(forKey: Keys.currentUser) else {
            print("No user data found in UserDefaults.")
            return nil
        }

        do {
            let user = try JSONDecoder().decode(User.self, from: userData)
            print("User loaded successfully from UserDefaults.")
            return user
        } catch {
            print("Failed to load user from UserDefaults: \(error)")
            return nil
        }
    }

    func deleteUser() {
        defaults.removeObject(forKey: Keys.currentUser)
        print("User data removed from UserDefaults.")
    }

    // Notification settings management
    var isNotificationEnabled: Bool {
        get {
            defaults.bool(forKey: Keys.isNotificationEnabled)
        }
        set {
            defaults.set(newValue, forKey: Keys.isNotificationEnabled)
            print("Notification setting updated: \(newValue)")
        }
    }

    // Default location management
    var defaultLocation: String? {
        get {
            defaults.string(forKey: Keys.defaultLocation)
        }
        set {
            defaults.set(newValue, forKey: Keys.defaultLocation)
            print("Default location updated: \(String(describing: newValue))")
        }
    }

    // Additional helper methods for debugging
    func printUserDefaults() {
        print("Current UserDefaults:")
        for (key, value) in defaults.dictionaryRepresentation() {
            print("\(key): \(value)")
        }
    }
}
