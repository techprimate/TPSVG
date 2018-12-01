//
//  TPSVGInstrQuadraticCurve.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGInstrQuadraticCurve: TPSVGInstruction {

    var end: CGPoint
    var control1: CGPoint
    let relative: Bool

    init(end: CGPoint, control1: CGPoint, relative: Bool = false) {
        self.end = end
        self.control1 = control1
        self.relative = relative
    }

    // MARK: - CustomStringConvertible

    override var description: String {
        return "TPSVGInstrQuadraticCurve {}"
    }

    // MARK: - CustomDebugStringConvertible

    override var debugDescription: String {
        return "TPSVGInstrQuadraticCurve { end: \(end), control1: \(control1), relative: \(relative) }"
    }

    // MARK: - Drawing

    override func modify(context: CGContext) {
        if relative {
            let ref = context.currentPointOfPath
            context.addCurve(to: ref + end, control1: ref + control1, control2: ref + control1)
        } else {
            context.addCurve(to: end, control1: control1, control2: control1)
        }
    }

    // MARK: - Equatable

    public static func == (lhs: TPSVGInstrQuadraticCurve, rhs: TPSVGInstrQuadraticCurve) -> Bool {
        guard lhs.end == rhs.end else {
            return false
        }
        guard lhs.control1 == rhs.control1 else {
            return false
        }
        guard lhs.relative == rhs.relative else {
            return false
        }
        return true
    }
}
