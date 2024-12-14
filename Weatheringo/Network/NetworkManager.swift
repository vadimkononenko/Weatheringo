//
//  NetworkManager.swift
//  Weatheringo
//
//  Created by Vadim Kononenko on 24.10.2024.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchWeatherForecast(for city: String = "London", days: Int = 3) async throws -> Weather {
        let endpoint = "http://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(city)&days=\(days)"
        
        guard let url = URL(string: endpoint) else { throw NetworkError.invalidUrl }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        return try JSONDecoder().decode(Weather.self, from: data)
    }
    
}
