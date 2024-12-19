//
//  StorageServiceProtocol.swift
//  WeatherTracker
//
//  Created by Spandana Vemula on 12/17/24.
//

import Foundation

protocol StorageServiceProtocol {
    func saveCityName(_ cityName: String)
    func getSavedCityName() -> String?
}
