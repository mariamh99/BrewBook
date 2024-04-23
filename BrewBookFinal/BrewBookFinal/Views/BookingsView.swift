//
//  BookingsView.swift
//  BrewBookFinal
//
import SwiftUI

struct BookingsView: View {
    @StateObject private var viewModel = BookingViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.bookings) { booking in
                NavigationLink(destination: BookingDetailView(booking: booking)) {
                    BookingRowView(booking: booking)
                }
            }
            .navigationTitle("Bookings")
            .onAppear {
                viewModel.loadBookings()
            }
        }
    }
}

struct BookingRowView: View {
    let booking: Booking
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(booking.cafe.name)
                .font(.headline)
            Text(booking.date, style: .date)
                .font(.subheadline)
            Text("Number of Guests: \(booking.numberOfGuests)")
                .font(.subheadline)
        }
    }
}

struct BookingDetailView: View {
    let booking: Booking
    
    var body: some View {
        VStack {
            Text(booking.cafe.name)
                .font(.title)
            Text(booking.date, style: .date)
            Text("Number of Guests: \(booking.numberOfGuests)")
            
            if let specialRequests = booking.specialRequests {
                Text("Special Requests: \(specialRequests)")
            }
        }
        .navigationBarTitle("Booking Details")
    }
}


