//
//  NetworkService.swift
//  BrewBookFinal
import Foundation

class NetworkService {
    func fetchCafes(completion: @escaping ([Cafe]?) -> Void) {
        guard let url = URL(string: "https://my-json-server.typicode.com/mariamh99/my-json-server/cafes") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let cafes = try decoder.decode([Cafe].self, from: data)
                completion(cafes)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
