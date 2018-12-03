//
//  TPSVGInstrCubicCurve.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGInstrCubicCurve: TPSVGInstruction {

    var end: CGPoint
    var control1: CGPoint
    var control2: CGPoint
    let relative: Bool

    init(control1: CGPoint, control2: CGPoint, end: CGPoint, relative: Bool = false) {
        self.end = end
        self.control1 = control1
        self.control2 = control2
        self.relative = relative
    }

    // MARK: - CustomStringConvertible

    override var description: String {
        return "TPSVGInstrCubicCurve {}"
    }

    // MARK: - CustomDebugStringConvertible

    override var debugDescription: String {
        return "TPSVGInstrCubicCurve { end: \(end), control1: \(control1), control2: \(control2), relative: \(relative) }"
    }

    // MARK: - Drawing

    override func modify(path: CGMutablePath, prev: TPSVGInstruction?, prevStartPoint: CGPoint?) {
        if relative {
            let ref = path.currentPoint
            path.addCurve(to: ref + end, control1: ref + control1, control2: ref + control2)
        } else {
            path.addCurve(to: end, control1: control1, control2: control2)

        }
    }

    // MARK: - Equatable

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
