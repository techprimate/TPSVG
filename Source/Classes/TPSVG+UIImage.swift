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
    public func image(antialias: Bool = true) -> UIImage? {
        defer {
            UIGraphicsEndImageContext()
        }
        UIGraphicsBeginImageContext(frame.size)

        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        context.setFillColor(UIColor.clear.cgColor)
        context.setStrokeColor(UIColor.clear.cgColor)
        context.setLineWidth(0)

        // Context configuration
        context.setShouldAntialias(antialias)

        for element in paths {
            context.setFillColor(fillColor(of: element).cgColor)
            context.setStrokeColor(strokeColor(of: element).cgColor)
            context.setLineWidth(strokeLineWidth(of: element))
            context.setMiterLimit(strokeMiterLimit(of: element))

            element.draw(in: context)
        }
        return UIGraphicsGetImageFromCurrentImageContext()
    }

    private func fillColor(of element: TPSVGElement) -> TPSVGColor {
        if let inline = element.inline?.fill {
            return inline
        }
        return element.styles.reduce(TPSVGColor.clear, { (prev, style) -> TPSVGColor in
            if let value = style.fill {
                return value
            }
            return prev
        })
    }

    private func strokeColor(of element: TPSVGElement) -> TPSVGColor {
        if let inline = element.inline?.stroke?.color {
            return inline
        }
        return element.styles.reduce(TPSVGColor.clear, { (prev, style) -> TPSVGColor in
            if let value = style.stroke?.color {
                return value
            }
            return prev
        })
    }

    private func strokeLineWidth(of element: TPSVGElement) -> CGFloat {
        if let inline = element.inline?.stroke?.width {
            return inline
        }
        return element.styles.reduce(0, { (prev, style) -> CGFloat in
            if let value = style.stroke?.width {
                return value
            }
            return prev
        })
    }

    private func strokeMiterLimit(of element: TPSVGElement) -> CGFloat {
        if let inline = element.inline?.stroke?.miterLimit {
            return inline
        }
        return  element.styles.reduce(0, { (prev, style) -> CGFloat in
            if let value = style.stroke?.miterLimit {
                return value
            }
            return prev
        })
    }
}
