//
//  TPSVGInstrSmoothQuadraticCurve.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGInstrSmoothQuadraticCurve: TPSVGInstruction {

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
        return "TPSVGInstrSmoothQuadraticCurve {}"
    }

    // MARK: - CustomDebugStringConvertible

    override var debugDescription: String {
        return "TPSVGInstrSmoothQuadraticCurve { end: \(end), control2: \(control2), relative: \(relative) }"
    }

    // MARK: - Drawing

    override func modify(context: CGContext) {
        // TODO: this
    }

    // MARK: - Equatable

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
