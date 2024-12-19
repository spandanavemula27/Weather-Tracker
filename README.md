# Weather Tracker App

This project is a SwiftUI-based weather application that allows users to search for a city and view its current weather information. The app fetches weather data using a ViewModel and presents it in a clean, user-friendly interface. The app was built with an emphasis on usability and efficient data handling within a limited time of 5 hours.

---

## Features

- **Search Functionality**:
  - Search for cities using a search bar.
  - Display search results dynamically.

- **Weather Details**:
  - Show selected city's weather information, including temperature, humidity, UV index, and "feels like" temperature.
  - Show city name with a location icon.

- **Custom UI**:
  - Designed using SwiftUI with custom fonts and styling.
  - Background colors and card-based layout for data presentation.

---

## Limitations

Due to the 5-hour time constraint, the following features were not fully implemented:

1. **Test Cases**:
   - Automated test cases are not included.
   - Adding tests for ViewModel and UI components is recommended for future iterations.

2. **Localization**:
   - Strings file for localization was not created.
   - All text is hardcoded in the views.

3. **Error Handling**:
   - Basic error handling exists but could be expanded for better user feedback during API failures.

4. **Performance Optimizations**:
   - While the app works efficiently for basic functionality, further optimizations can be done for large-scale use.

---

## Instructions to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/spandanavemula27/Weather-Tracker.git
   ```

2. Open the project in Xcode.

3. Run the app on a simulator or a physical device.

4. Use the search bar to search for a city and view its weather details.

---

## Future Enhancements

1. **Add Unit and UI Test Cases**:
   - Integrate test cases using XCTest.

2. **Localization**:
   - Add a `Localizable.strings` file for multilingual support.

3. **Improved Error Handling**:
   - Show user-friendly alerts for network issues or invalid inputs.

4. **Extended Features**:
   - Display hourly and weekly weather forecasts.
   - Allow users to save favorite cities.

---

## Acknowledgment

This project was developed as part of a timed exercise. Please note that it reflects the work completed within the allocated 5-hour timeframe.

