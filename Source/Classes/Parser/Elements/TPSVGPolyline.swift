//
//  TPSVGPolyline.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: Add documentation
 */
class TPSVGPolyline: TPSVGElement {

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
        guard let rawPoints = attributes["points"] else {
            return nil
        }
        self.points = TPSVGValueLexer.parsePoints(from: rawPoints)
        super.init(attributes: attributes)
    }

    // MARK: - Equatable

    /**
     TODO: Add documentation
     */
    internal static func == (lhs: TPSVGPolyline, rhs: TPSVGPolyline) -> Bool {
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
        guard let path = createPath() else {
            return
        }
        context.addPath(path)
        context.fillPath()
        context.addPath(path)
        context.strokePath()
    }

    // MARK: - Calculations

    /// :nodoc:
    override internal var bounds: CGRect {
        return createPath()?.boundingBoxOfPath ?? .null
    }

    // MARK: - Path

    private func createPath() -> CGPath? {
        let path = CGMutablePath()
        for (idx, point) in points.enumerated() {
            if idx == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }

        return path.copy(using: &resolvedTransform)
    }
}
