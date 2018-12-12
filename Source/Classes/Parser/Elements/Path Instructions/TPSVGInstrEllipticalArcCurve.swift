//
//  TPSVGInstrEllipticalArcCurve.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: Add documentation
 */
class TPSVGInstrEllipticalArcCurve: TPSVGInstruction {

    /**
     TODO: Add documentation
     */
    var end: CGPoint

    /**
     TODO: Add documentation
     */
    var radius: CGVector

    /**
     TODO: Add documentation
     */
    var xAxisRotation: CGFloat

    /**
     TODO: Add documentation
     */
    var largeArcFlag: Bool

    /**
     TODO: Add documentation
     */
    var sweepFlag: Bool

    /**
     TODO: Add documentation
     */
    let relative: Bool

    /**
     TODO: Add documentation
     */
    init(radius: CGVector, xAxisRotation: CGFloat, largeArcFlag: Bool,
         sweepFlag: Bool, end: CGPoint, relative: Bool = false) {
        self.end = end
        self.radius = radius
        self.xAxisRotation = xAxisRotation
        self.largeArcFlag = largeArcFlag
        self.sweepFlag = sweepFlag
        self.relative = relative
    }

    // MARK: - CustomStringConvertible

    /// :nodoc:
    override var description: String {
        return "TPSVGInstrEllipticalArcCurve {}"
    }

    // MARK: - CustomDebugStringConvertible

    /// :nodoc:
    override var debugDescription: String {
        return "TPSVGInstrEllipticalArcCurve { radius: \(radius), x-axis-rotation: \(xAxisRotation), "
            + "largeArcFlag: \(largeArcFlag), sweepFlag: \(sweepFlag), end: \(end), relative: \(relative) }"
    }

    // MARK: - Drawing

    /**
     TODO: Add documentation
     */
    // swiftlint:disable identifier_name
    override func modify(path: CGMutablePath, prev: TPSVGInstruction?, prevStartPoint: CGPoint?) {
        let tau = CGFloat.pi * 2.0
        let phi: (sin: CGFloat, cos: CGFloat) = (sin: sin(xAxisRotation / 360 * tau),
                                                 cos: cos(xAxisRotation / 360 * tau))

        let start = path.isEmpty ? .zero : path.currentPoint
        let c = end + (relative ? start : .zero)
        let pp = CGPoint(x: phi.cos * (start.x - c.x) / 2 + phi.sin * (start.y - c.y) / 2,
                         y: -phi.sin * (start.x - c.x) / 2 + phi.cos * (start.y - c.y) / 2)
        guard pp != .zero else {
            return
        }

        var r = abs(radius)
        let lambda = pow(pp.x, 2) / pow(r.dx, 2) + pow(pp.y, 2) / pow(r.dy, 2)
        if lambda > 1 {
            r *= sqrt(lambda)
        }

        let rSq = pow(r, 2)
        let ppSq = pow(pp, 2)

        var radicant = max((rSq.dx * rSq.dy) - (rSq.dx * ppSq.y) - (rSq.dy * ppSq.x), 0)
        radicant /= (rSq.dx * ppSq.y) + (rSq.dy * ppSq.x)
        radicant = sqrt(radicant) * (largeArcFlag == sweepFlag ? -1 : 1)

        let centerP = CGPoint(x: radicant * r.dx / r.dy * pp.y, y: radicant * -r.dy / r.dx * pp.x)
        let v1 = CGPoint(x: (pp.x - centerP.x) / rSq.dx, y: (pp.y - centerP.y) / rSq.dy)
        let v2 = CGPoint(x: (-pp.x - centerP.x) / rSq.dx, y: (-pp.y - centerP.y) / rSq.dy)

        var ang1 = vectorAngle(u: CGVector(dx: 1, dy: 0), v: CGVector(dx: v1.x, dy: v1.y))
        var ang2 = vectorAngle(u: CGVector(dx: v1.x, dy: v1.y), v: CGVector(dx: v2.x, dy: v2.y))

        if sweepFlag == false && ang2 > 0 {
            ang2 -= tau
        }
        if sweepFlag == true && ang2 < 0 {
            ang2 += tau
        }

        let segments = Int(max(ceil(abs(ang2) / (tau / 4.0)), 1))
        ang2 /= CGFloat(segments)

        let center = CGPoint(x: phi.cos * centerP.x - phi.sin * centerP.y + (start.x + c.x) / 2,
                             y: phi.sin * centerP.x + phi.cos * centerP.y + (start.y + c.y) / 2)

        for _ in 0..<segments {
            calcCurve(to: path, center: center, phi: phi, radius: r, ang1: ang1, ang2: ang2)
            ang1 += ang2
        }
    }

    /**
     Calculates the control and end points using the given arc parameters and adds it to the path.
     */
    private func calcCurve(to path: CGMutablePath, center: CGPoint, phi: (sin: CGFloat, cos: CGFloat),
                           radius: CGVector, ang1: CGFloat, ang2: CGFloat) {
        let factor: CGFloat = 4.0 / 3.0 * tan(ang2 / 4.0)

        let point1 = CGPoint(x: cos(ang1), y: sin(ang1))
        let point2 = CGPoint(x: cos(ang1 + ang2), y: sin(ang1 + ang2))

        let p1 = mapToEllipse(point: CGPoint(x: point1.x - point1.y * factor, y: point1.y + point1.x * factor),
                              radius: radius, cosPhi: phi.cos, sinPhi: phi.sin, center: center)
        let p2 = mapToEllipse(point: CGPoint(x: point2.x + point2.y * factor, y: point2.y - point2.x * factor),
                              radius: radius, cosPhi: phi.cos, sinPhi: phi.sin, center: center)
        let p  = mapToEllipse(point: point2, radius: radius, cosPhi: phi.cos, sinPhi: phi.sin, center: center)

        path.addCurve(to: p, control1: p1, control2: p2)
    }

    /**
     TODO: Add documentation
     */
    private func mapToEllipse(point: CGPoint, radius: CGVector, cosPhi: CGFloat, sinPhi: CGFloat, center: CGPoint) -> CGPoint {
        return center + CGPoint(x: cosPhi * point.x * radius.dx - sinPhi * point.y * radius.dy,
                                y: sinPhi * point.x * radius.dx + cosPhi * point.y * radius.dy)
    }

    /**
     TODO: Add documentation
     */
    private func vectorAngle(u: CGVector, v: CGVector) -> CGFloat {
        let dot = u.dot(v)
        let len = u.length * v.length

        var ang = acos(max(min(dot / len, 1), -1))
        if u.dx * v.dy - u.dy * v.dx < 0 {
            ang = -ang
        }
        return ang
    }

    // MARK: - Equatable

    /**
     TODO: Add documentation
     */
    internal static func == (lhs: TPSVGInstrEllipticalArcCurve, rhs: TPSVGInstrEllipticalArcCurve) -> Bool {
        guard lhs.end == rhs.end else {
            return false
        }
        guard lhs.radius == rhs.radius else {
            return false
        }
        guard lhs.xAxisRotation == rhs.xAxisRotation else {
            return false
        }
        guard lhs.largeArcFlag == rhs.largeArcFlag else {
            return false
        }
        guard lhs.sweepFlag == rhs.sweepFlag else {
            return false
        }
        guard lhs.relative == rhs.relative else {
            return false
        }
        return true
    }
}
