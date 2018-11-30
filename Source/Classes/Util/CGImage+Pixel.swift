//
//  CGImage+Pixel.swift
//  TPSVG_Tests
//
//  Created by Philip Niedertscheider on 28.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: documentation
 */
extension CGImage {

    /**
     TODO: documentation
     */
    func pixel(at point: CGPoint) -> UIColor? {
        return pixels(at: [point])?.first
    }

    /**
     TODO: documentation
     */
    func pixels(at points: [CGPoint]) -> [UIColor]? {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bytesPerPixel = 4
        let bytesPerRow = bytesPerPixel * width
        let bitsPerComponent = 8
        let bitmapInfo: UInt32 = CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue

        guard let context = CGContext(data: nil, width: width, height: height,
                                      bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow,
                                      space: colorSpace, bitmapInfo: bitmapInfo),
            let ptr = context.data?.assumingMemoryBound(to: UInt8.self) else {
                return nil
        }

        context.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))

        return points.map({ point in
            let i = bytesPerRow * Int(point.y) + bytesPerPixel * Int(point.x)

            let alpha = CGFloat(ptr[i + 3]) / 255.0
            let red = (CGFloat(ptr[i]) / alpha) / 255.0
            let green = (CGFloat(ptr[i + 1]) / alpha) / 255.0
            let blue = (CGFloat(ptr[i + 2]) / alpha) / 255.0

            return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        })
    }
}
