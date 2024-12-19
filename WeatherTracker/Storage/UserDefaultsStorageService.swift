//
//  UserDefaultsStorageService.swift
//  WeatherTracker
//
//  Created by Spandana Vemula on 12/17/24.
//

import Foundation

class UserDefaultsStorageService: StorageServiceProtocol {
    private let key = "savedCityName"

    func saveCityName(_ cityName: String) {
        UserDefaults.standard.set(cityName, forKey: key)
    }

    func getSavedCityName() -> String? {
        UserDefaults.standard.string(forKey: key)
    }
}

