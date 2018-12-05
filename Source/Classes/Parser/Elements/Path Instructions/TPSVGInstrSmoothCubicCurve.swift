//
//  TPSVGInstrSmoothCubicCurve.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: Add documentation
 */
class TPSVGInstrSmoothCubicCurve: TPSVGInstruction {

    /**
     TODO: Add documentation
     */
    var end: CGPoint

    /**
     TODO: Add documentation
     */
    var control2: CGPoint

    /**
     TODO: Add documentation
     */
    let relative: Bool

    /**
     TODO: Add documentation
     */
    init(end: CGPoint, control2: CGPoint, relative: Bool = false) {
        self.end = end
        self.control2 = control2
        self.relative = relative
    }

    // MARK: - CustomStringConvertible

    /**
     TODO: Add documentation
     */
    override var description: String {
        return "TPSVGInstrSmoothCubicCurve {}"
    }

    // MARK: - CustomDebugStringConvertible

    /**
     TODO: Add documentation
     */
    override var debugDescription: String {
        return "TPSVGInstrSmoothCubicCurve { end: \(end), control2: \(control2), relative: \(relative) }"
    }

    // MARK: - Drawing

    /**
     Modifies a given path using the logic of this instruction.

     Adds a smooth cubic curve to the given `path` starting and the current point.
     This requires a previous instruction `prev`, as the reflection of its second control point on the current point is used as the first control point.

     - Parameter path: Active path, which should be modified
     - Parameter prev: Previous instruction if exists, might be null.
     - Parameter prevStartPoint: Start point of previous instruction, used to calculate control points with relative values
     */
    override func modify(path: CGMutablePath, prev: TPSVGInstruction?, prevStartPoint: CGPoint?) {
        let current = path.isEmpty ? .zero : path.currentPoint
        var control1 = current
        var prevControl2: CGPoint?
        var prevRelative = false
        if let prevCubic = prev as? TPSVGInstrCubicCurve {
            prevControl2 = prevCubic.control2
            prevRelative = prevCubic.relative
        } else if let prevSmoothCubic = prev as? TPSVGInstrSmoothCubicCurve {
            prevControl2 = prevSmoothCubic.control2
            prevRelative = prevSmoothCubic.relative
        } else if let prevQuadratic = prev as? TPSVGInstrQuadraticCurve {
            prevControl2 = prevQuadratic.control1
            prevRelative = prevQuadratic.relative
        } else if let prevSmoothQuadratic = prev as? TPSVGInstrSmoothQuadraticCurve {
            prevControl2 = prevSmoothQuadratic.control2
            prevRelative = prevSmoothQuadratic.relative
        }
        if let prevC2 = prevControl2, let prevSp = prevStartPoint {
            if prevRelative {
                let absolutePrevC2 = prevSp + prevC2
                let diff = current - absolutePrevC2
                control1 = current + diff
            } else {
                let diff = current - prevC2
                control1 = current + diff
            }
        }

        if relative {
            path.addCurve(to: current + end, control1: control1, control2: current + control2)
        } else {
            path.addCurve(to: end, control1: control1, control2: control2)
        }
    }

    // MARK: - Equatable

    /**
     TODO: Add documentation
     */
    public static func == (lhs: TPSVGInstrSmoothCubicCurve, rhs: TPSVGInstrSmoothCubicCurve) -> Bool {
        guard lhs.end == rhs.end else {
            return false
        }
        guard lhs.control2 == rhs.control2 else {
            return false
        }
        guard lhs.relative == rhs.relative else {
            return false
        }
        return true
    }
}
