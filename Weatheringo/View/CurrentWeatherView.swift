//
//  CurrentWeatherView.swift
//  Weatheringo
//
//  Created by Vadim Kononenko on 29.10.2024.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            Text(viewModel.weatherForecast?.location.name ?? "City")
                .font(.system(size: 28))
            
            Text(String(format: "%.0f°", viewModel.weatherForecast?.current.tempC ?? 0.0))
                .font(.system(size: 72, weight: .medium))
            
            HStack {
                Text("Max: ")
                + Text(String(format: "%.0f°", viewModel.weatherForecast?.forecast.forecastday.first?.day.maxtempC ?? 0.0))
                
                Text("Min: ")
                + Text(String(format: "%.0f°", viewModel.weatherForecast?.forecast.forecastday.first?.day.mintempC ?? 0.0))
            }
            .font(.system(size: 22))
        }
    }
}

#Preview {
    CurrentWeatherView()
        .environmentObject(MainViewModel())
}
