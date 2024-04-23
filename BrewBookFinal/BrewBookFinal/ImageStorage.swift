//
//  ImageStorage.swift
//  BrewBookFinal
//
import SwiftUI

struct ImageStorage {
    private let defaults = UserDefaults.standard
    private let imageKey = "savedImages"
    
    func saveImage(_ imageData: Data) {
        var savedImages = getSavedImageData()
        savedImages.append(imageData)
        defaults.set(savedImages, forKey: imageKey)
    }
    
    func getImages() -> [UIImage] {
        let savedImageData = getSavedImageData()
        return savedImageData.compactMap { UIImage(data: $0) }
    }
    
    private func getSavedImageData() -> [Data] {
        return defaults.array(forKey: imageKey) as? [Data] ?? []
    }
}
