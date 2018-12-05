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
    public var points: [CGPoint]

    /**
     TODO: Add documentation
     */
    public init(classNames: [String] = [], points: [CGPoint] = []) {
        self.points = points
        super.init(classNames: classNames)
    }

    /**
     TODO: Add documentation
     */
    public override init?(attributes: [String: String]) {
        guard let rawPoints = attributes["points"] else {
            return nil
        }
        self.points = rawPoints.split(separator: " ").compactMap({ item -> CGPoint? in
            let comps = item.split(separator: ",")
            guard comps.count == 2 else {
                return nil
            }
            guard let x = TPSVGNumberParser.parse(String(comps[0])), let y = TPSVGNumberParser.parse(String(comps[1])) else {
                return nil
            }
            return CGPoint(x: x.value, y: y.value)
        })
        super.init(attributes: attributes)
    }

    // MARK: - Equatable

    /**
     TODO: Add documentation
     */
    public static func == (lhs: TPSVGPolygon, rhs: TPSVGPolygon) -> Bool {
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

        context.addPath(path)
        context.fillPath()
        context.addPath(path)
        context.strokePath()
    }

    // MARK: - Calculations

    /// :nodoc:
    override public var bounds: CGRect {
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
