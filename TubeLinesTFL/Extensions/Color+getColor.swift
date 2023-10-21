//
//  Color+getColor.swift
//  TubeLinesTFL
//
//  Created by Mauro Arantes on 21/10/2023.
//

import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
    
    static func getColor(tubeLineName: String) -> Color {
        switch tubeLineName {
        case "bakerloo":
            return Color(hex: 0xB36305)
        case "central":
            return Color(hex: 0xE32017)
        case "circle":
            return Color(hex: 0xFFD300)
        case "district":
            return Color(hex: 0x00782A)
        case "hammersmith-city":
            return Color(hex: 0xF3A9BB)
        case "jubilee":
            return Color(hex: 0xA0A5A9)
        case "metropolitan":
            return Color(hex: 0x660066)
        case "northern":
            return Color(hex: 0x000000)
        case "piccadilly":
            return Color(hex: 0x000099)
        case "victoria":
            return Color(hex: 0x0098D4)
        case "waterloo-city":
            return Color(hex: 0x66CCCC)
        default:
            return .clear
        }
    }
}
