//
//  Booking.swift
//  BrewBookFinal
import Foundation

struct Booking: Identifiable, Codable {
    let id: UUID
    let user: User
    let cafe: Cafe
    let date: Date
    let numberOfGuests: Int
    let specialRequests: String?
}
