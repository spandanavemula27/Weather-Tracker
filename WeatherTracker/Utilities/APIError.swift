//
//  APIError.swift
//  WeatherTracker
//
//  Created by Spandana Vemula on 12/17/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

