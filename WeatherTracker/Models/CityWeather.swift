//
//  CityWeather.swift
//  WeatherTracker
//
//  Created by Spandana Vemula on 12/17/24.
//

import Foundation

struct CityWeather: Codable {
    let cityName: String
    let temperature: Double
    let iconURL: String
}
