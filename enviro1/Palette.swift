//
//  Palette.swift
//  enviro1
//
//  Created by Peter Richardson on 11/29/24.
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
    
    struct Palette {
        static var Periwinkle = Color(hex: 0xB4ADEA)
        static var DarkSlateGray = Color(hex: 0x35605A)
        static var ShamrockGreen = Color(hex: 0x4F9D69)
        static var Mindaro = Color(hex: 0xD7F75B)
        static var EnglishViolet = Color(hex: 0x48304D)
        static var Tomato = Color(hex: 0xFF453E)
        static var ChinaRose = Color(hex: 0x9B5566)
        static var Lavender = Color(hex: 0xDCD7E1)
        static var Aureolin = Color(hex: 0xF6E936)
        static var NonPhotoBlue = Color(hex: 0x73D1DD)
        static var RazzleDazzleRose = Color(hex: 0xFF3FCF)
        static var SpaceCadet = Color(hex: 0x26273A)
    }
}
