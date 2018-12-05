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
    public var classNames: [String]

    /**
     */
    public var inheritedStyles: [TPSVGStyle]

    /**
     Holds a reference to the SVG styles, resolved by `classNames`.
     */
    public var styles: [TPSVGStyle]

    /**
     Holds a style represnting all inline styling
     */
    public var inline: TPSVGStyle?

    /**
     Style which should be used for drawing
     */
    public var resolvedStyle: TPSVGStyle?

    /**
     TODO: documentation
     */
    public init(classNames: [String] = [], inheritedStyles: [TPSVGStyle] = [], styles: [TPSVGStyle] = [], inline: TPSVGStyle? = nil) {
        self.classNames = classNames
        self.inheritedStyles = inheritedStyles
        self.styles = styles
        self.inline = inline
    }

    /**
     Initalises an instance using the given `attributes`
     */
    public init?(attributes: [String: String]) {
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
    }

    /**
     TODO: documentation
     */
    public static func == (lhs: TPSVGElement, rhs: TPSVGElement) -> Bool {
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
    public func draw(in context: CGContext) {}

    // MARK: - CustomStringConvertible

    /**
     TODO: Add documentation
     */
    public var description: String {
        return "TPSVGElement {}"
    }

    // MARK: - CustomDebugStringConvertible

    /**
     TODO: Add documentation
     */
    public var debugDescription: String {
        return "TPSVGElement { classes: \(classNames), styles: \(styles) }"
    }

    // MARK: - Calculations

    public var bounds: CGRect {
        return .zero
    }
}
