//
//  TPSVGElement.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: documentation
 */
class TPSVGElement: Equatable, CustomStringConvertible, CustomDebugStringConvertible {

    /**
     TODO: documentation
     */
    internal var classNames: [String]

    /**
     */
    internal var inheritedStyles: [TPSVGStyle]

    /**
     Holds a reference to the SVG styles, resolved by `classNames`.
     */
    internal var styles: [TPSVGStyle]

    /**
     Holds a style represnting all inline styling
     */
    internal var inline: TPSVGStyle?

    /**
     Style which should be used for drawing
     */
    internal var resolvedStyle: TPSVGStyle?

    internal var transforms: [TPSVGTransform]
    internal var resolvedTransform = CGAffineTransform.identity

    /**
     TODO: documentation
     */
    internal init(classNames: [String] = [],
                  inheritedStyles: [TPSVGStyle] = [],
                  styles: [TPSVGStyle] = [],
                  transforms: [TPSVGTransform] = [],
                  inline: TPSVGStyle? = nil) {
        self.classNames = classNames
        self.inheritedStyles = inheritedStyles
        self.styles = styles
        self.inline = inline
        self.transforms = transforms
    }

    /**
     Initalises an instance using the given `attributes`
     */
    internal init?(attributes: [String: String]) {
        self.classNames = attributes["class"]?.split(separator: " ").map({ String($0) }) ?? []
        self.styles = []
        self.inheritedStyles = []

        var inlineFillColor: TPSVGColor?
        if let rawHex = attributes["fill"] {
            inlineFillColor = TPSVGColor(hex: rawHex)
        }

        if inlineFillColor != nil {
            var i = 10 // Start at 10 so it will start with "a"

            var name: String!
            repeat {
                name = String(format: "%x", i)
                i += 1
            } while classNames.contains("." + name)

            inline = TPSVGStyle(name: name,
                                fill: inlineFillColor,
                                stroke: nil,
                                font: nil)
        }

        if let raw = attributes["transform"] {
            self.transforms = TPSVGTransformLexer.parse(raw: raw)
        } else {
            self.transforms = []
        }
    }

    /**
     TODO: documentation
     */
    internal static func == (lhs: TPSVGElement, rhs: TPSVGElement) -> Bool {
        if let lhs = lhs as? TPSVGCircle, let rhs = rhs as? TPSVGCircle {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGEllipse, let rhs = rhs as? TPSVGEllipse {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGGroup, let rhs = rhs as? TPSVGGroup {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGPath, let rhs = rhs as? TPSVGPath {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGPolygon, let rhs = rhs as? TPSVGPolygon {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGPolyline, let rhs = rhs as? TPSVGPolyline {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGRect, let rhs = rhs as? TPSVGRect {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGText, let rhs = rhs as? TPSVGText {
            return lhs == rhs
        }

        guard lhs.classNames == rhs.classNames else {
            return false
        }
        guard lhs.styles == rhs.styles else {
            return false
        }
        return true
    }

    // MARK: - Rendering

    /**
     TODO: Add documentation
     */
    internal func draw(in context: CGContext) {}

    // MARK: - CustomStringConvertible

    /**
     TODO: Add documentation
     */
    internal var description: String {
        return "TPSVGElement {}"
    }

    // MARK: - CustomDebugStringConvertible

    /**
     TODO: Add documentation
     */
    internal var debugDescription: String {
        return "TPSVGElement { classes: \(classNames), styles: \(styles) }"
    }

    // MARK: - Calculations

    internal var bounds: CGRect {
        return .zero
    }
}
