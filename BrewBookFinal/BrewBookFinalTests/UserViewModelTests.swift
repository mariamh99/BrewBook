////
////  UserViewModelTests.swift
////  BrewBookFinalTests
//
//import XCTest
//@testable import BrewBookFinal
//
//class UserViewModelTests: XCTestCase {
//    var viewModel: UserViewModel!
//    var userDefaults: UserDefaults!
//
//    override func setUp() {
//        super.setUp()
//        // Create a 'testing' instance of UserDefaults
//        userDefaults = UserDefaults(suiteName: #file)
//        userDefaults?.removePersistentDomain(forName: #file)
//        
//        viewModel = UserViewModel(userDefaults: userDefaults)
//    }
//
//    override func tearDown() {
//        // Clean up and delete all data from the testing instance to isolate tests
//        userDefaults?.removePersistentDomain(forName: #file)
//        userDefaults = nil
//        viewModel = nil
//        super.tearDown()
//    }
//
//    func testFetchUser_WithExistingData() {
//        // Prepare data
//        let user = User(id: "1", firstName: "Test", lastName: "User", email: "test@example.com", phoneNumber: "1234567890", profileImageURL: nil)
//        let encodedData = try! JSONEncoder().encode(user)
//        userDefaults.set(encodedData, forKey: "currentUser")
//
//        // Run
//        viewModel.fetchUser()
//
//        // Validate
//        XCTAssertNotNil(viewModel.user, "User should be loaded")
//        XCTAssertEqual(viewModel.user?.email, "test@example.com", "Loaded user should have the correct email")
//    }
//
//    func testUpdateUser() {
//        // Prepare
//        let user = User(id: "2", firstName: "New", lastName: "User", email: "new@example.com", phoneNumber: "0987654321", profileImageURL: nil)
//        
//        // Run
//        viewModel.updateUser(user)
//
//        // Validate
//        let storedData = userDefaults.data(forKey: "currentUser")
//        XCTAssertNotNil(storedData, "User data should be stored in UserDefaults")
//        
//        let storedUser = try! JSONDecoder().decode(User.self, from: storedData!)
//        XCTAssertEqual(storedUser.email, "new@example.com", "Stored user should have the updated email")
//    }
//}
