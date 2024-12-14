//
//  WeatheringoApp.swift
//  Weatheringo
//
//  Created by Vadim Kononenko on 24.10.2024.
//

import SwiftUI

@main
struct WeatheringoApp: App {
    
    @StateObject private var viewModel = MainViewModel()
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .environmentObject(viewModel)
    }
}
