//
//  TPSVGGroup.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGGroup: TPSVGElement {

    public var elements: [TPSVGElement]

    public init(elements: [TPSVGElement] = []) {
        self.elements = elements
        super.init(classNames: [])
    }

    // MARK: - Equatable

    public static func == (lhs: TPSVGGroup, rhs: TPSVGGroup) -> Bool {
        guard lhs.classNames == rhs.classNames else {
            return false
        }
        guard lhs.elements == rhs.elements else {
            return false
        }
        return true
    }

    // MARK: - Drawing

    override func draw(in context: CGContext) {
        for element in elements {
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
    }
}
