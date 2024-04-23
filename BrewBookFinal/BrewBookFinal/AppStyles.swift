//
//  AppStyles.swift
//  BrewBookFinal
import SwiftUI

struct AppStyles {
    static let backgroundColor = Color(hex: 0xf9f9f9)
    static let primaryButtonStyle = PrimaryButtonStyle()
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(Color.blue.cornerRadius(10))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double((hex & 0xff)) / 255,
            opacity: alpha
        )
    }
}

