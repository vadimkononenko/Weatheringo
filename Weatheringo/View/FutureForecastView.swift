//
//  FutureForecastView.swift
//  Weatheringo
//
//  Created by Vadim Kononenko on 30.10.2024.
//

import SwiftUI

struct FutureForecastView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            ForEach(viewModel.weatherForecast?.forecast.forecastday ?? []) { forecast in
                HStack {
                    Text(forecast.date)
                        .frame(maxWidth: .infinity)
                    
                    AsyncImage(url: URL(string: "http:\(forecast.day.condition.icon)")) { image in
                        image
                            .resizable()
                            .frame(width: 50, height: 50)
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 10)
                    }
                    .frame(maxWidth: .infinity)

                    HStack(spacing: 20) {
                        Text("↓ \(Int(forecast.day.mintempC))°")
                        
                        Text("↑ \(Int(forecast.day.maxtempC))°")
                    }
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .background(.thinMaterial)
        .cornerRadius(12)
        .padding()
    }
}

#Preview {
    FutureForecastView()
        .environmentObject(MainViewModel())
}
