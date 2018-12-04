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
    public func image() -> UIImage? {
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
        context.setShouldAntialias(false)

        for element in paths {
            // Style
            if let fill = element.styles.reduce(nil, { (prev, style) -> TPSVGColor? in
                return style.fill != nil ? style.fill : prev
            }) {
                context.setFillColor(fill.cgColor)
            } else {
                context.setFillColor(UIColor.clear.cgColor)
            }

            if let strokeColor = element.styles.reduce(nil, { (prev, style) -> TPSVGColor? in
                return style.stroke?.color != nil ? style.stroke?.color : prev
            }) {
                context.setStrokeColor(strokeColor.cgColor)
            } else {
                context.setStrokeColor(TPSVGColor.clear.cgColor)
            }

            if let strokeLineWidth = element.styles.reduce(nil, { (prev, style) -> CGFloat? in
                return style.stroke?.width != nil ? style.stroke?.width : prev
            }) {
                context.setLineWidth(strokeLineWidth)
            } else {
                context.setLineWidth(0)
            }

            if let strokeMiterLimit = element.styles.reduce(nil, { (prev, style) -> CGFloat? in
                return style.stroke?.miterLimit != nil ? style.stroke?.miterLimit : prev
            }) {
                context.setMiterLimit(strokeMiterLimit)
            } else {
                context.setMiterLimit(0)
            }

            element.draw(in: context)
        }
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
