//
//  EncryptionManager.swift
//  BrewBookFinal
//
import CryptoSwift
import SwiftUI

class EncryptionManager {
    static let shared = EncryptionManager()
    
    private let key = "YourSecureEncryptionKey".data(using: .utf8)!
    private let iv = "YourInitializationVector".data(using: .utf8)!
    
    private init() {}
    
    func encrypt(_ data: Data) -> Data {
        do {
            let encrypted = try AES(key: key.bytes, blockMode: CBC(iv: iv.bytes), padding: .pkcs7).encrypt(data.bytes)
            return Data(encrypted)
        } catch {
            print("Error encrypting data: \(error.localizedDescription)")
            return data
        }
    }
    
    func decrypt(_ data: Data) -> Data {
        do {
            let decrypted = try AES(key: key.bytes, blockMode: CBC(iv: iv.bytes), padding: .pkcs7).decrypt(data.bytes)
            return Data(decrypted)
        } catch {
            print("Error decrypting data: \(error.localizedDescription)")
            return data
        }
    }
}
