//Cafe.swift
import Foundation

struct Cafe: Identifiable, Codable {
    let id: String
    let name: String
    let location: String
    let coordinates: Coordinates
    let rating: String
    let imageURL: URL
}

struct Coordinates: Codable {
    let lat: Double
    let lon: Double
}
