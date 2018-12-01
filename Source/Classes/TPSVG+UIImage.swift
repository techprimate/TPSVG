//
//  TPSVG+UIImage.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//

extension TPSVG {

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
            }
            if let stroke = element.styles.reduce(nil, { (prev, style) -> TPSVGStroke? in
                return style.stroke != nil ? style.stroke : prev
            }) {
                context.setStrokeColor(stroke.color?.cgColor ?? UIColor.clear.cgColor)
                context.setLineWidth(stroke.width ?? 0)
            }

            element.draw(in: context)
        }
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
