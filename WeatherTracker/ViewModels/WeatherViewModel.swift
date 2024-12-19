//
//  WeatherViewModel.swift
//  WeatherTracker
//
//  Created by Spandana Vemula on 12/17/24.
//

import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    
    @Published var weather: Weather?
    @Published var searchResult: CityWeather?
    @Published var errorMessage: String?
    @Published var isSearching: Bool = false
    @Published var isLoading: Bool = false

    private let weatherService: WeatherServiceProtocol
    private let storageService: StorageServiceProtocol

    init(weatherService: WeatherServiceProtocol, storageService: StorageServiceProtocol) {
        self.weatherService = weatherService
        self.storageService = storageService
    }

    func fetchSavedWeather() {
        guard let city = storageService.getSavedCityName() else { return }
        isLoading = true
        Task {
            do {
                weather = try await weatherService.fetchWeather(for: city)
            } catch {
                errorMessage = "Failed to load weather: \(error.localizedDescription)"
            }
            isLoading = false
        }
    }

    func searchCity(query: String) {
        isLoading = true
        Task {
            do {
                let fetchedWeather = try await weatherService.fetchWeather(for: query)
                searchResult = CityWeather(
                    cityName: fetchedWeather.cityName,
                    temperature: fetchedWeather.temperature,
                    iconURL: fetchedWeather.iconURL
                )
                
            } catch {
                errorMessage = "Search failed: \(error.localizedDescription)"
                searchResult = nil
            }
            isLoading = false
        }
    }

    func saveCityAndFetchWeather(cityName: String) {
        storageService.saveCityName(cityName)
        fetchSavedWeather()
    }
}
