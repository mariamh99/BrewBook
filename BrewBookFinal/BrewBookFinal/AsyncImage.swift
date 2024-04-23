//
//  AsyncImage.swift
//  BrewBookFinal
//
import SwiftUI

struct AsyncImage: View {
    @StateObject private var imageLoader = ImageLoader()  // Initialize here directly
    
    var url: URL  // Hold URL in a variable

    init(url: URL) {
        self.url = url
    }
    
    var body: some View {
        Group {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            imageLoader.loadImage(from: url)  // Load image when the view appears
        }
        .onDisappear {
            imageLoader.cancelLoading()
        }
    }
}
