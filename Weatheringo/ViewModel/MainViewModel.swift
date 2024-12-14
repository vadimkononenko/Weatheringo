//
//  MainViewModel.swift
//  Weatheringo
//
//  Created by Vadim Kononenko on 24.10.2024.
//

import Foundation

@MainActor
class MainViewModel: ObservableObject {
    
    @Published var weatherForecast: Weather?
    
    private let networkManager = NetworkManager.shared
    
    let defaultCity: String = "Kyiv"
    
    func formatTime(timeInterval: Double) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH"
        
        let time = Date(timeIntervalSince1970: timeInterval)
        
        return timeFormatter.string(from: time)
    }
    
    func fetchWeatherForecast() async {
        do {
            weatherForecast = try await networkManager.fetchWeatherForecast()
        } catch {
            print(error.localizedDescription)
        }
    }
}
