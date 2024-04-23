// CafeViewModel.swift
import Foundation
import Combine

class CafeViewModel: ObservableObject {
    @Published var cafes: [Cafe] = []
    private var allCafes: [Cafe] = []
    private var cancellables = Set<AnyCancellable>()
    private let networkService = NetworkService()
    
    init() {
        fetchCafes()
    }
    
    func fetchCafes() {
        networkService.fetchCafes { [weak self] cafes in
            guard let self = self, let cafes = cafes else { return }
            
            DispatchQueue.main.async {
                self.allCafes = cafes
                self.cafes = cafes
            }
        }
    }
    
    func searchCafes(by name: String) {
        guard !name.isEmpty else {
            cafes = allCafes
            return
        }
        cafes = allCafes.filter { $0.name.localizedCaseInsensitiveContains(name) }
    }
    
    func filterCafes(by criteria: [String: Any]) {
        cafes = allCafes.filter { cafe in
            // Example: Filtering by rating
            if let rating = criteria["rating"] as? String, cafe.rating != rating {
                return false
            }
            return true
        }
    }
}
