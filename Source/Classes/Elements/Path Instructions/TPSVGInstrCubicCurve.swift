//
//  TPSVGInstrCubicCurve.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: Add documentation
 */
class TPSVGInstrCubicCurve: TPSVGInstruction {

    /**
     TODO: Add documentation
     */
    var end: CGPoint

    /**
     TODO: Add documentation
     */
    var control1: CGPoint

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
    init(control1: CGPoint, control2: CGPoint, end: CGPoint, relative: Bool = false) {
        self.end = end
        self.control1 = control1
        self.control2 = control2
        self.relative = relative
    }

    // MARK: - CustomStringConvertible

    /**
     TODO: Add documentation
     */
    override var description: String {
        return "TPSVGInstrCubicCurve {}"
    }

    // MARK: - CustomDebugStringConvertible

    /**
     TODO: Add documentation
     */
    override var debugDescription: String {
        return "TPSVGInstrCubicCurve {control1: \(control1), control2: \(control2), end: \(end), relative: \(relative) }"
    }

    // MARK: - Drawing

    /**
     TODO: Add documentation
     */
    override func modify(path: CGMutablePath, prev: TPSVGInstruction?, prevStartPoint: CGPoint?) {
        if relative {
            let ref = path.currentPoint
            path.addCurve(to: ref + end, control1: ref + control1, control2: ref + control2)
        } else {
            path.addCurve(to: end, control1: control1, control2: control2)

        }
    }

    // MARK: - Equatable

    /**
     TODO: Add documentation
     */
    public static func == (lhs: TPSVGInstrCubicCurve, rhs: TPSVGInstrCubicCurve) -> Bool {
        guard lhs.end == rhs.end else {
            return false
        }
        guard lhs.control1 == rhs.control1 else {
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
