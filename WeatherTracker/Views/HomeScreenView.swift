//
//  HomeScreenView.swift
//  WeatherTracker
//
//  Created by Spandana Vemula on 12/17/24.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var searchQuery: String = ""
    @FocusState private var isTextFieldFocused: Bool
    @StateObject private var viewModel: WeatherViewModel

    init(viewModel: WeatherViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(
                    searchQuery: $searchQuery,
                    isTextFieldFocused: _isTextFieldFocused,
                    onSearch: {
                        viewModel.isSearching = true
                        viewModel.searchCity(query: searchQuery)
                    }
                )

                if viewModel.isSearching {
                    SearchResultCard(
                        result: viewModel.searchResult,
                        onSelect: {
                            viewModel.saveCityAndFetchWeather(cityName: searchQuery)
                            viewModel.isSearching = false
                            searchQuery = ""
                        }
                    )
                } else if let city = viewModel.weather {
                    WeatherDetailsView(weather: city)
                } else if !viewModel.isLoading {
                    NoCityView()
                } 

                Spacer()
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Cancel") {
                        isTextFieldFocused = false
                        searchQuery = ""
                        viewModel.isSearching = false
                    }
                    .font(.headline)
                    Spacer()
                }
            }
            .task {
                viewModel.fetchSavedWeather()
            }
        }
    }
}


struct SearchBar: View {
    @Binding var searchQuery: String
    @FocusState var isTextFieldFocused: Bool
    var onSearch: () -> Void

    var body: some View {
        ZStack(alignment: .trailing) {
            TextField("Search Location", text: $searchQuery)
                .focused($isTextFieldFocused)
                .padding()
                .font(.custom("Poppins-Bold", size: 15))
                .cornerRadius(15)
                .padding(.leading, 5)
                .padding(.trailing, 30)
                .onSubmit {
                    onSearch()
                }
                .submitLabel(.search)

            Image(systemName: "magnifyingglass")
                .foregroundColor(Color(hex: "#C4C4C4"))
                .padding(.trailing, 16)
                .onTapGesture {
                    onSearch()
                }
        }
        .frame(height: 46)
        .background(Color(hex: "#F2F2F2"))
        .cornerRadius(15)
        .padding([.trailing, .leading, .top], 16)
    }
}

struct SearchResultCard: View {
    var result: CityWeather?
    var onSelect: () -> Void

    var body: some View {
        if let result = result {
            VStack {
                Button(action: onSelect) {
                    HStack {
                        VStack(spacing: 8) {
                            Text(result.cityName)
                                .font(.custom("Poppins-Bold", size: 20))
                                .foregroundColor(Color(hex: "#2C2C2C"))
                            Text("\(Int(result.temperature))°")
                                .font(.custom("Poppins-Bold", size: 60))
                                .foregroundColor(Color(hex: "#2C2C2C"))
                        }
                        .padding(.leading, 32)
                        Spacer()
                        AsyncImage(url: URL(string: result.iconURL)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 123, height: 123)
                        } placeholder: {
                            ProgressView()
                        }
                        .padding(.trailing, 16)
                    }
                    .background(Color(hex: "#F2F2F2"))
                    .cornerRadius(16)
                }
                .padding([.leading, .trailing], 16)
            }
            .padding(.top, 16)
        }
    }
}

struct WeatherDetailsView: View {
    var weather: Weather

    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: URL(string: weather.iconURL)) { image in
                image
                    .resizable()
                    .frame(width: 123, height: 123)
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            HStack(spacing: 10) {
                Text(weather.cityName)
                    .font(.custom("Poppins-Bold", size: 30))
                    .foregroundColor(Color(hex: "#2C2C2C"))
                Image(systemName: "location.fill")
                    .resizable()
                    .frame(width: 21, height: 21)
                    .foregroundColor(.black)
            }
            Text("\(Int(weather.temperature))°")
                .font(.custom("Poppins-Bold", size: 75))
                .foregroundColor(Color(hex: "#2C2C2C"))
            HStack {
                WeatherMetric(label: "Humidity", value: "\(weather.humidity)%")
                Spacer()
                WeatherMetric(label: "UV", value: "\(weather.uvIndex)")
                Spacer()
                WeatherMetric(label: "Feels like", value: "\(Int(weather.feelsLike))°")
            }
            .frame(width: 274)
            .padding(16)
            .background(Color(hex: "#F2F2F2"))
            .cornerRadius(16)
        }
        .padding()
    }
}

struct WeatherMetric: View {
    var label: String
    var value: String

    var body: some View {
        VStack(spacing: 5) {
            Text(label)
                .font(.custom("Poppins", size: 12))
                .foregroundColor(Color(hex: "#C4C4C4"))
            Text(value)
                .font(.custom("Poppins", size: 15))
                .foregroundColor(Color(hex: "#9A9A9A"))
        }
    }
}

struct NoCityView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("No City Selected")
                .font(.custom("Poppins-Bold", size: 30))
                .foregroundColor(Color(hex: "#2C2C2C"))
            Text("Please Search For A City")
                .font(.custom("Poppins-Bold", size: 15))
                .foregroundColor(Color(hex: "#2C2C2C"))
        }
        .padding(.top, -64)
    }
}
