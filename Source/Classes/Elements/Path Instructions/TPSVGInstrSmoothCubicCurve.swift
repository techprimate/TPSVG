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

    override func modify(context: CGContext, prev: TPSVGInstruction?) {
        if relative {
            let ref = context.currentPointOfPath
            // TODO: this here
//            context.addCurve(to: ref + end, control1: ref + control1, control2: ref + control2)
        } else {
//            context.addCurve(to: end, control1: control1, control2: control2)

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
