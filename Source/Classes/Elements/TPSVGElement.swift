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
public class TPSVGElement: Equatable, CustomStringConvertible, CustomDebugStringConvertible {

    /**
     TODO: documentation
     */
    public var classNames: [String]

    /**
     Holds a reference to the SVG styles, resolved by `classNames`.
     */
    public var styles: [TPSVGStyle]

    /**
     TODO: documentation
     */
    public init(classNames: [String]) {
        self.classNames = classNames
        self.styles = []
    }

    /**
     Initalises an instance using the given `attributes`
     */
    public init?(attributes: [String: String]) {
        self.classNames = attributes["class"]?.split(separator: " ").map({ String($0) }) ?? []
        self.styles = []
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

    public func draw(in context: CGContext) {}

    // MARK: - CustomStringConvertible

    public var description: String {
        return "TPSVGElement {}"
    }

    // MARK: - CustomDebugStringConvertible

    public var debugDescription: String {
        return "TPSVGElement { classes: \(classNames), styles: \(styles) }"
    }
}
