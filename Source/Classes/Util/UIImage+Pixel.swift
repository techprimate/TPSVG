//
//  UIImage+Pixel.swift
//  TPSVG_Tests
//
//  Created by Philip Niedertscheider on 28.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: documentation
 */
extension UIImage {

    /**
     TODO: documentation
     */
    internal func pixel(at point: CGPoint) -> UIColor? {
        return cgImage?.pixel(at: point)
    }

    /**
     TODO: documentation
     */
    internal func pixels(at points: [CGPoint]) -> [UIColor]? {
        return cgImage?.pixels(at: points)
    }

    /**
     TODO: documentation
     */
    internal func pixelsEqual(to other: UIImage, threshold: Double = 0.01) -> Bool {
        return pixelError(to: other) <= threshold
    }

    /**
     TODO: documentation
     */
    internal func pixelError(to other: UIImage) -> Double {
        guard let cgImg = self.cgImage, let otherCGImage = other.cgImage else {
            return 1.0
        }
        return cgImg.pixelError(to: otherCGImage)
    }
}
