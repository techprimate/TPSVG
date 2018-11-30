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
     Creates a color from an RGB or RGBA hex string (e.g. "#609187" or "#feb38674").

     If the given `hex` is invalid, it will return a black color.

     - Parameter hex: A hexa-decimal color string representation.
     */
    public convenience init(hex: String) {
        let trimmed = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: trimmed)
        if trimmed.hasPrefix("#") {
            scanner.scanLocation += 1
        }

        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            self.init(hex: color, useAlpha: trimmed.count > 7)
        } else {
            self.init(hex: 0x000000)
        }
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
}
