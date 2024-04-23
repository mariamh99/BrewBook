//
//  BookingView.swift
//  BrewBookFinal
//
import SwiftUI

struct BookingView: View {
    let cafe: Cafe
    @EnvironmentObject var userViewModel: UserViewModel  // Ensure this is passed down correctly in the environment
    @StateObject private var viewModel = BookingViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    DatePicker("Date", selection: $viewModel.selectedDate, displayedComponents: [.date])
                    Stepper("Number of Guests: \(viewModel.numberOfGuests)", value: $viewModel.numberOfGuests, in: 1...10)
                    TextField("Special Requests", text: $viewModel.specialRequests)
                }
                
                Section {
                    Button(action: bookingAction) {
                        Text("Confirm Booking")
                    }
                }
            }
            .navigationBarTitle("Book \(cafe.name)")
        }
    }
    
    private func bookingAction() {
        if let currentUser = userViewModel.user {
            if userViewModel.isUserLoggedIn(withId: currentUser.id) {
                viewModel.createBooking(cafe: cafe, user: currentUser)
                presentationMode.wrappedValue.dismiss()
            } else {
                print("User not logged in")
            }
        } else {
            print("No user available for booking")
        }
    }
}
