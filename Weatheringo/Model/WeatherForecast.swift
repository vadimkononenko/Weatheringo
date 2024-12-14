//
//  Weather.swift
//  Weatheringo
//
//  Created by Vadim Kononenko on 24.10.2024.
//

import Foundation

// MARK: - WeatherResponse
struct Weather: Codable {
    let location: Location
    let current: Current
    let forecast: Forecast
    
    enum CodingKeys: String, CodingKey {
        case location, current, forecast
    }
}

// MARK: - Current
struct Current: Codable {
    let tempC: Double
    let isDay: Int
    let condition: Condition
    let feelslikeC: Double

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
        case feelslikeC = "feelslike_c"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text: String
    let icon: String
    let code: Int
}

// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]
}

// MARK: - Forecastday
struct Forecastday: Codable, Identifiable {
    let id = UUID().uuidString
    let date: String
    let dateEpoch: Int
    let day: Day
    let hour: [Hour]

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, hour
    }
}

// MARK: - Day
struct Day: Codable {
    let maxtempC, mintempC, avgtempC: Double
    let totalsnowCM: Int
    let condition: Condition

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case avgtempC = "avgtemp_c"
        case totalsnowCM = "totalsnow_cm"
        case condition
    }
}

// MARK: - Hour
struct Hour: Codable, Identifiable {
    let id = UUID().uuidString
    let timeEpoch: Int
    let time: String
    let tempC: Double
    let isDay: Int
    let condition: Condition
    let snowCM: Int
    let feelslikeC: Double

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
        case snowCM = "snow_cm"
        case feelslikeC = "feelslike_c"
    }
}

// MARK: - Location
struct Location: Codable {
    let name, region, country: String
    let lat, lon: Double
    let tzID: String
    let localtimeEpoch: Int
    let localtime: String

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}
