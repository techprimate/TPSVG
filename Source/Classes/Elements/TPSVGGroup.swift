//
//  TPSVGGroup.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: Add documentation
 */
class TPSVGGroup: TPSVGElement {

    /**
     TODO: Add documentation
     */
    public var elements: [TPSVGElement]

    /**
     TODO: Add documentation
     */
    public init(elements: [TPSVGElement] = [], classNames: [String] = []) {
        self.elements = elements
        super.init(classNames: classNames)
    }

    // MARK: - Equatable

    /**
     TODO: Add documentation
     */
    public static func == (lhs: TPSVGGroup, rhs: TPSVGGroup) -> Bool {
        guard lhs.classNames == rhs.classNames else {
            return false
        }
        guard lhs.elements == rhs.elements else {
            return false
        }
        return true
    }

    // MARK: - CustomStringConvertible

    override var description: String {
        return String(describing: type(of: self)) + " { elements: \(elements.count) }"
    }

    // MARK: - CustomStringDebugConvertible

    override var debugDescription: String {
        return String(describing: type(of: self)) + " { elements: " + elements.map({ $0.debugDescription }).joined() + " }"
    }

    // MARK: - Drawing

    /**
     TODO: Add documentation
     */
    override func draw(in context: CGContext) {
        for element in elements {
            context.setFillColor(TPSVG.fillColor(of: element).cgColor)
            context.setStrokeColor(TPSVG.strokeColor(of: element).cgColor)
            context.setLineWidth(TPSVG.strokeLineWidth(of: element))
            context.setMiterLimit(TPSVG.strokeMiterLimit(of: element))

            element.draw(in: context)
        }
    }

    // MARK: - Calculations

    /// :nodoc:
    override public var bounds: CGRect {
        return elements.reduce(CGRect.null, { (prev, element) -> CGRect in
            return prev.union(element.bounds)
        })
    }
}
