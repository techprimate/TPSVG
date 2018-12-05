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
        return cropAndResize(image: fullSizeImage, crop: crop, size: size, contentMode: contentMode)
    }

    // swiftlint:disable cyclomatic_complexity
    private func cropAndResize(image: UIImage, crop: Bool, size: CGSize?, contentMode: TPSVGImageContentMode) -> UIImage? {
        let bounds = self.contentBounds
        var scaleFactor: CGPoint = CGPoint(x: 1, y: 1)
        var offset: CGPoint = .zero
        let targetSize = size ?? bounds.size

        if crop {
            // Translate context to start at correct bound
            offset = -1 * bounds.origin
            if let scaledSize = size {
                scaleFactor = scaledSize / bounds.size
            }
        } else if let scaledSize = size {
            scaleFactor = scaledSize / frame.size
        }

        // Change scale based on content mode
        switch contentMode {
        case .scaleToFill:
            break
        case .scaleAspectFit:
            scaleFactor = CGPoint(x: min(scaleFactor.x, scaleFactor.y), y: min(scaleFactor.x, scaleFactor.y))
        case .scaleAspectFill:
            scaleFactor = CGPoint(x: max(scaleFactor.x, scaleFactor.y), y: max(scaleFactor.x, scaleFactor.y))
        case .topLeft, .top, .topRight,
             .left, .center, .right,
             .bottomLeft, .bottom, .bottomRight:
            scaleFactor = CGPoint(x: 1, y: 1)
        }

        switch contentMode {
        case .scaleToFill:
            break
        case .scaleAspectFit:
            offset.x += (targetSize.width / scaleFactor.x - bounds.width) / 2
            offset.y += (targetSize.height / scaleFactor.y - bounds.height) / 2
        case .scaleAspectFill:
            offset.x += (targetSize.width / scaleFactor.x - bounds.width) / 2
            offset.y += (targetSize.height / scaleFactor.y - bounds.height) / 2
        case .topLeft:
            break
        case .top:
            break
        case .topRight:
            break
        case .left:
            break
        case .center:
            break
        case .right:
            break
        case .bottomLeft:
            break
        case .bottom:
            break
        case .bottomRight:
            break
        }

        UIGraphicsBeginImageContext(targetSize)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        context.scaleBy(x: scaleFactor.x, y: scaleFactor.y)
        image.draw(in: CGRect(origin: offset, size: image.size))
        context.scaleBy(x: 1 / scaleFactor.x, y: 1 / scaleFactor.y)
        return UIGraphicsGetImageFromCurrentImageContext()
    }

    internal static func fillColor(of element: TPSVGElement) -> TPSVGColor {
        return element.resolvedStyle?.fill ?? TPSVGColor.black
    }

    internal static func strokeColor(of element: TPSVGElement) -> TPSVGColor {
        return element.resolvedStyle?.stroke?.color ?? TPSVGColor.clear
    }

    internal static func strokeLineWidth(of element: TPSVGElement) -> CGFloat {
        return element.resolvedStyle?.stroke?.width ?? 1
    }

    internal static func strokeMiterLimit(of element: TPSVGElement) -> CGFloat {
        return element.resolvedStyle?.stroke?.miterLimit ?? 4
    }
}
