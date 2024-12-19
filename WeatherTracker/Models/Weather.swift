//
//  Weather.swift
//  WeatherTracker
//
//  Created by Spandana Vemula on 12/17/24.
//

import Foundation

struct Weather: Codable {
    let cityName: String
    let temperature: Double
    let iconURL: String
    let humidity: Int
    let uvIndex: Int
    let feelsLike: Double
}

