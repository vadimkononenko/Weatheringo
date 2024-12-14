//
//  NetworkError.swift
//  Weatheringo
//
//  Created by Vadim Kononenko on 29.10.2024.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidUrl
    case invalidResponse
    case invalidData
    case invalidRequest
    case error(description: String)
}
