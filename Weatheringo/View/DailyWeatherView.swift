//
//  DailyWeatherView.swift
//  Weatheringo
//
//  Created by Vadim Kononenko on 29.10.2024.
//

import SwiftUI

struct DailyWeatherView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Daily weather")
                .font(.headline)
                .padding()
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.weatherForecast?.forecast.forecastday.first?.hour ?? []) { hour in
                        VStack {
                            Text(viewModel.formatTime(timeInterval: Double(hour.timeEpoch)))
                            
                            AsyncImage(url: URL(string: "http:\(hour.condition.icon)")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                RoundedRectangle(cornerRadius: 10)
                            }
                            .frame(width: 50, height: 50)
                            
                            Text("\(Int(hour.tempC))°")
                        }
                    }
                }
            }
            .scrollIndicators(.never)
        }
        .background(.thinMaterial)
        .cornerRadius(12)
        .padding()
    }
}

#Preview {
    DailyWeatherView()
        .environmentObject(MainViewModel())
}
