//
//  TPSVGEllipse.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: Add documentation
 */
class TPSVGEllipse: TPSVGElement {

    /**
     TODO: Add documentation
     */
    internal var center: CGPoint

    /**
     TODO: Add documentation
     */
    internal var radius: CGVector

    /**
     TODO: Add documentation
     */
    internal init(classNames: [String] = [], center: CGPoint = .zero, radius: CGVector = .zero) {
        self.center = center
        self.radius = radius
        super.init(classNames: classNames)
    }

    /**
     TODO: Add documentation
     */
    internal override init?(attributes: [String: String]) {
        guard let rawX = attributes["cx"], let x = TPSVGNumberParser.parse(rawX) else {
            return nil
        }
        guard let rawY = attributes["cy"], let y = TPSVGNumberParser.parse(rawY) else {
            return nil
        }
        center = CGPoint(x: x.value, y: y.value)

        guard let rawRadiusY = attributes["rx"], let radiusX = TPSVGNumberParser.parse(rawRadiusY) else {
            return nil
        }
        guard let rawRadiusX = attributes["ry"], let radiusY = TPSVGNumberParser.parse(rawRadiusX) else {
            return nil
        }
        self.radius = CGVector(dx: radiusX.value, dy: radiusY.value)

        super.init(attributes: attributes)
    }

    // MARK: - Equatable

    /**
     TODO: Add documentation
     */
    internal static func == (lhs: TPSVGEllipse, rhs: TPSVGEllipse) -> Bool {
        guard lhs.classNames == rhs.classNames else {
            return false
        }
        guard lhs.classNames == rhs.classNames else {
            return false
        }
        guard lhs.center == rhs.center else {
            return false
        }
        guard lhs.radius == rhs.radius else {
            return false
        }
        return true
    }

    // MARK: - Drawing

    /**
     TODO: Add documentation
     */
    override func draw(in context: CGContext) {
        let path = CGMutablePath()
        let origin = CGPoint(x: center.x - radius.dx, y: center.y - radius.dy)
        let size = CGSize(width: 2 * radius.dx, height: 2 * radius.dy)
        path.addEllipse(in: CGRect(origin: origin, size: size))

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
        path.addEllipse(in: CGRect(x: center.x - radius.dx,
                                   y: center.y - radius.dy,
                                   width: 2 * radius.dx,
                                   height: 2 * radius.dy))
        return path.boundingBoxOfPath
    }
}
