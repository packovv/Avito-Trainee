//
//  NetworkManager.swift
//  Avito Trainee
//
//  Created by packovv on 18.10.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    let cacheKey: NSString = "key"
    var welcomeCache = NSCache<NSString, WelcomeHolder>()
    
    private init() {}
    
    func fetchData(from url: String, complition: @escaping(Result<Welcome, NetworkError>) -> Void) {
        
        if let cache = welcomeCache.object(forKey: cacheKey) {
            complition(.success(cache.welcomeHolder))
            print("The struct is cached yet")
        } else {
            
            guard let url = URL(string: url) else {
                complition(.failure(.invalidURL))
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data else {
                    complition(.failure(.noData))
                    print(error?.localizedDescription ?? "no description")
                    return
                }

                do {
                    let welcome = try JSONDecoder().decode(Welcome.self, from: data)
                    DispatchQueue.main.async {
                        complition(.success(welcome))
                        let welcomeClass = WelcomeHolder(welcomeHolder: welcome)
                        self.welcomeCache.setObject(welcomeClass, forKey: self.cacheKey)
                        print("Cache the struct")
                    }
                } catch {
                    complition(.failure(.decodingError))
                }
            }.resume()
            
        }
    }
}
