//
//  TPSVG+UIImage.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//

/**
 TODO: Add documentation
 */
extension TPSVG {

    /**
     TODO: Add documentation
     */
    public func image(size: CGSize? = nil, crop: Bool = false, contentMode: TPSVGImageContentMode = .scaleToFill, antialias: Bool = true) -> UIImage? {
        defer {
            UIGraphicsEndImageContext()
        }

        UIGraphicsBeginImageContext(frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        // Context configuration
        context.setShouldAntialias(antialias)

        // Draw all elements
        for element in paths {
            context.setFillColor(TPSVG.fillColor(of: element).cgColor)
            context.setStrokeColor(TPSVG.strokeColor(of: element).cgColor)
            context.setLineWidth(TPSVG.strokeLineWidth(of: element))
            context.setMiterLimit(TPSVG.strokeMiterLimit(of: element))

            element.draw(in: context)
        }

        // Get image from context or fail
        guard let fullSizeImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        UIGraphicsEndImageContext()

        guard crop || size != nil else {
            return fullSizeImage
        }
        return cropAndResize(image: fullSizeImage, crop: crop, size: size)
    }

    private func cropAndResize(image: UIImage, crop: Bool, size: CGSize?) -> UIImage? {
        let bounds = self.contentBounds
        var scaleFactor: CGPoint = CGPoint(x: 1, y: 1)
        var offset: CGPoint = .zero

        if crop {
            // Translate context to start at correct bound
            offset = -1 * bounds.origin
            if let scaledSize = size {
                scaleFactor = scaledSize / bounds.size
            }
        } else if let scaledSize = size {
            scaleFactor = scaledSize / frame.size
        }

        UIGraphicsBeginImageContext(size ?? bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        context.scaleBy(x: scaleFactor.x, y: scaleFactor.y)
        image.draw(in: CGRect(origin: offset, size: image.size))
        context.scaleBy(x: 1 / scaleFactor.x, y: 1 / scaleFactor.y)
        return UIGraphicsGetImageFromCurrentImageContext()
    }

    internal static func fillColor(of element: TPSVGElement) -> TPSVGColor {
        if let inline = element.inline?.fill {
            return inline
        }
        return (element.inheritedStyles + element.styles).reduce(TPSVGColor.clear, { (prev, style) -> TPSVGColor in
            if let value = style.fill {
                return value
            }
            return prev
        })
    }

    internal static func strokeColor(of element: TPSVGElement) -> TPSVGColor {
        if let inline = element.inline?.stroke?.color {
            return inline
        }
        return (element.inheritedStyles + element.styles).reduce(TPSVGColor.clear, { (prev, style) -> TPSVGColor in
            if let value = style.stroke?.color {
                return value
            }
            return prev
        })
    }

    internal static func strokeLineWidth(of element: TPSVGElement) -> CGFloat {
        if let inline = element.inline?.stroke?.width {
            return inline
        }
        return (element.inheritedStyles + element.styles).reduce(0, { (prev, style) -> CGFloat in
            if let value = style.stroke?.width {
                return value
            }
            return prev
        })
    }

    internal static func strokeMiterLimit(of element: TPSVGElement) -> CGFloat {
        if let inline = element.inline?.stroke?.miterLimit {
            return inline
        }
        return  (element.inheritedStyles + element.styles).reduce(0, { (prev, style) -> CGFloat in
            if let value = style.stroke?.miterLimit {
                return value
            }
            return prev
        })
    }
}
