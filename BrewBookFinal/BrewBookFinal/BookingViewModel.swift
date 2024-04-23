//
//  BookingViewModel.swift
//  BrewBookFinal
//
import Foundation
import Combine
import FirebaseFirestore
import FirebaseAuth

class BookingViewModel: ObservableObject {
    @Published var bookings: [Booking] = []
    private var db = Firestore.firestore()
    
    func fetchBookings() {
        db.collection("bookings").whereField("userId", isEqualTo: Auth.auth().currentUser?.uid ?? "")
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                self.bookings = documents.compactMap { queryDocumentSnapshot in
                    try? queryDocumentSnapshot.data(as: Booking.self)
                }
            }
    }
    
    func addBooking(_ booking: Booking) {
        do {
            let _ = try db.collection("bookings").addDocument(from: booking)
            print("Booking added")
        } catch {
            print("There was an error adding the booking: \(error)")
        }
    }
}
