//
//  TPSVGInstrSmoothQuadraticCurve.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: Add documentation
 */
class TPSVGInstrSmoothQuadraticCurve: TPSVGInstruction {

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
        return "TPSVGInstrSmoothQuadraticCurve {}"
    }

    // MARK: - CustomDebugStringConvertible

    /**
     TODO: Add documentation
     */
    override var debugDescription: String {
        return "TPSVGInstrSmoothQuadraticCurve { end: \(end), control2: \(control2), relative: \(relative) }"
    }

    // MARK: - Drawing

    /**
     TODO: Add documentation
     */
    override func modify(path: CGMutablePath, prev: TPSVGInstruction?, prevStartPoint: CGPoint?) {
        let ref = path.isEmpty ? .zero : path.currentPoint

        var control1 = ref
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
                let diff = ref - absolutePrevC2
                control1 = ref + diff
            } else {
                let diff = ref - prevC2
                control1 = ref + diff
            }
        }

        if relative {
            path.addQuadCurve(to: ref + end, control: control1)
        } else {
            path.addQuadCurve(to: end, control: control1)

        }
    }

    // MARK: - Equatable

    /**
     TODO: Add documentation
     */
    public static func == (lhs: TPSVGInstrSmoothQuadraticCurve, rhs: TPSVGInstrSmoothQuadraticCurve) -> Bool {
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
