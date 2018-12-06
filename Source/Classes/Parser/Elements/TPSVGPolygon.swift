//
//  TPSVGPolygon.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: Add documentation
 */
class TPSVGPolygon: TPSVGElement {

    /**
     TODO: Add documentation
     */
    internal var points: [CGPoint]

    /**
     TODO: Add documentation
     */
    internal init(classNames: [String] = [], points: [CGPoint] = []) {
        self.points = points
        super.init(classNames: classNames)
    }

    /**
     TODO: Add documentation
     */
    internal override init?(attributes: [String: String]) {
        self.points = []

        if let rawPoints = attributes["points"] {
            self.points = TPSVGValueLexer.parsePoints(from: rawPoints)
        }
        super.init(attributes: attributes)
    }

    // MARK: - Equatable

    /**
     TODO: Add documentation
     */
    internal static func == (lhs: TPSVGPolygon, rhs: TPSVGPolygon) -> Bool {
        guard lhs.classNames == rhs.classNames else {
            return false
        }
        guard lhs.points == rhs.points else {
            return false
        }
        return true
    }

    // MARK: - Draw

    /**
     TODO: Add documentation
     */
    override func draw(in context: CGContext) {
        guard points.count > 0 else {
            return
        }
        let path = CGMutablePath()
        for (idx, point) in points.enumerated() {
            if idx == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        path.closeSubpath()

        var transform = resolvedTransform
        if let transformedPath = path.copy(using: &transform) {
            context.addPath(transformedPath)
            context.fillPath()
            context.addPath(transformedPath)
            context.strokePath()
        }
    }

    // MARK: - Calculations

    /// :nodoc:
    override internal var bounds: CGRect {
        let path = CGMutablePath()

        for (idx, point) in points.enumerated() {
            if idx == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        path.closeSubpath()

        return path.boundingBoxOfPath
    }
}
