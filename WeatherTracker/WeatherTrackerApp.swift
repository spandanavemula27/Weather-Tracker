//
//  WeatherTrackerApp.swift
//  WeatherTracker
//
//  Created by Spandana Vemula on 12/17/24.
//

import SwiftUI

@main
struct WeatherTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreenView(viewModel: WeatherViewModel(
                weatherService: WeatherService(api: WeatherAPI()),
                storageService: UserDefaultsStorageService()
            ))
        }
    }
}
