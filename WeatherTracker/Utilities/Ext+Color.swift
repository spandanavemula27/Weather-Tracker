//
//  Ext+Color.swift
//  WeatherTracker
//
//  Created by Spandana Vemula on 12/17/24.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hexSanitized = hex.replacingOccurrences(of: "#", with: "")
        
        var int = UInt64()
        Scanner(string: hexSanitized).scanHexInt64(&int)
        
        let red = Double((int & 0xFF0000) >> 16) / 255.0
        let green = Double((int & 0x00FF00) >> 8) / 255.0
        let blue = Double(int & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
