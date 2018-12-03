//
//  TPSVGInstrSmoothCubicCurve.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGInstrSmoothCubicCurve: TPSVGInstruction {

    var end: CGPoint
    var control2: CGPoint
    let relative: Bool

    init(end: CGPoint, control2: CGPoint, relative: Bool = false) {
        self.end = end
        self.control2 = control2
        self.relative = relative
    }

    // MARK: - CustomStringConvertible

    override var description: String {
        return "TPSVGInstrSmoothCubicCurve {}"
    }

    // MARK: - CustomDebugStringConvertible

    override var debugDescription: String {
        return "TPSVGInstrSmoothCubicCurve { end: \(end), control2: \(control2), relative: \(relative) }"
    }

    // MARK: - Drawing

    override func modify(path: CGMutablePath, prev: TPSVGInstruction?, prevStartPoint: CGPoint?) {
        var control1 = path.currentPoint
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
                let diff = path.currentPoint - absolutePrevC2
                control1 = path.currentPoint + diff
            } else {
                let diff = path.currentPoint - prevC2
                control1 = path.currentPoint + diff
            }
        }

        if relative {
            let ref = path.currentPoint
            path.addCurve(to: ref + end, control1: control1, control2: ref + control2)
        } else {
            path.addCurve(to: end, control1: control1, control2: control2)

        }
    }

    // MARK: - Equatable

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
