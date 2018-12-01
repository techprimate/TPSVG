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
    func pixel(at point: CGPoint) -> UIColor? {
        return cgImage?.pixel(at: point)
    }

    /**
     TODO: documentation
     */
    func pixels(at points: [CGPoint]) -> [UIColor]? {
        return cgImage?.pixels(at: points)
    }

    /**
     TODO: documentation
     */
    func pixelsEqual(to other: UIImage, threshold: Double = 0.1) -> Bool {
        guard let cgImg = self.cgImage, let otherCGImage = other.cgImage else {
            return false
        }
        return cgImg.pixelsEqual(to: otherCGImage, threshold: threshold)
    }
}
