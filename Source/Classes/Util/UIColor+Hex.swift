//
//  UIColor+Hex.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 Extension to work with hexadecimal strings and values.
 */
extension UIColor {

    /**
     Creates a color from an RGB, RGBA, RRGGBB or RRGGBBAA hex string (e.g. "#666", "#666F", "#609187" or "#feb38674").

     If the given `hex` is invalid, it will return a black color.

     - Parameter hex: A hexa-decimal color string representation.
     */
    public convenience init(hex: String) {
        var trimmed = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.hasPrefix("#") {
            trimmed = String(trimmed[trimmed.index(trimmed.startIndex, offsetBy: 1)...])
        }

        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 1.0

        let scanner = Scanner(string: trimmed)
        var hexValue: CUnsignedLongLong = 0

        if scanner.scanHexInt64(&hexValue) {
            let length = trimmed.count

            switch length {
            case 3:
                red = CGFloat((hexValue & 0xF00) >> 8)   / 15.0
                green = CGFloat((hexValue & 0x0F0) >> 4)   / 15.0
                blue = CGFloat(hexValue & 0x00F)          / 15.0
            case 4:
                red = CGFloat((hexValue & 0xF000) >> 12) / 15.0
                green = CGFloat((hexValue & 0x0F00) >> 8)  / 15.0
                blue  = CGFloat((hexValue & 0x00F0) >> 4) / 15.0
                alpha = CGFloat(hexValue & 0x000F)         / 15.0
            case 6:
                red = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                blue  = CGFloat(hexValue & 0x0000FF)          / 255.0
            case 8:
                red = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                blue = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
            default:
                print("Invalid number of values (\(length)) in HEX string. Make sure to enter 3, 4, 6 or 8 values. E.g. `aabbccff`")
            }
        } else {
            print("Invalid HEX value: " + hex)
        }

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    /**
     Creates a color from an hex integer (e.g. 0xece3b4).
     - parameter hex: A hexa-decimal UInt32 that represents a color.
     - parameter alphaChannel: If true the given hex-decimal UInt32 includes the alpha channel (e.g. e0df00ff).
     */
    public convenience init(hex: UInt32, useAlpha alphaChannel: Bool = false) {
        let white = UInt32(0xffffff)
        let mask = UInt32(0xFF)
        let limit = !alphaChannel && hex > white ? white : hex

        let red = limit >> (alphaChannel ? 24 : 16) & mask
        let green = limit >> (alphaChannel ? 16 : 8) & mask
        let blue = limit >> (alphaChannel ? 8 : 0) & mask
        let alpha = alphaChannel ? limit & mask : 255

        self.init(red: CGFloat(red) / 255,
                  green: CGFloat(green) / 255,
                  blue: CGFloat(blue) / 255,
                  alpha: CGFloat(alpha) / 255)
    }

    /**
     Creates a hexa-decimal string representing this color.

     If the alpha component is 1.0 then the result will be in format `#RRGGBB`.
     Otherwise the result will be in format `#RRGGBBAA`
     */
    public var hex: String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        if !getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            print("Could not convert color to hex string.")
        }

        var rgb = 0
        let redI = (Int)(red * 255)
        let greenI = (Int)(green * 255)
        let blueI = (Int)(blue * 255)
        let alphaI = (Int)(alpha * 255)

        if alpha == 1.0 {
            rgb = redI << 16
            rgb |= greenI << 8
            rgb |= blueI << 0

            return String(format: "#%06x", rgb)
        } else {
            rgb = redI << 24
            rgb |= greenI << 16
            rgb |= blueI << 8
            rgb |= alphaI << 0

            return String(format: "#%08x", rgb)
        }
    }
}
