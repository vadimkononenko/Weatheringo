//
//  MainView.swift
//  Weatheringo
//
//  Created by Vadim Kononenko on 24.10.2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            Color.bg.ignoresSafeArea()
            
            VStack(spacing: 16) {
                CurrentWeatherView()
                
                DailyWeatherView()
                
                FutureForecastView()
                
                Spacer()
            }
            .padding(.top, 58)
        }
        .task {
            await viewModel.fetchWeatherForecast()
        }
    }
}

#Preview {
    MainView()
        .environmentObject(MainViewModel())
}
