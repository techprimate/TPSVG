//
//  TPSVGInstrQuadraticCurve.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: Add documentation
 */
class TPSVGInstrQuadraticCurve: TPSVGInstruction {

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
    let relative: Bool

    /**
     TODO: Add documentation
     */
    init(end: CGPoint, control1: CGPoint, relative: Bool = false) {
        self.end = end
        self.control1 = control1
        self.relative = relative
    }

    // MARK: - CustomStringConvertible

    /**
     TODO: Add documentation
     */
    override var description: String {
        return "TPSVGInstrQuadraticCurve {}"
    }

    // MARK: - CustomDebugStringConvertible

    /**
     TODO: Add documentation
     */
    override var debugDescription: String {
        return "TPSVGInstrQuadraticCurve { end: \(end), control1: \(control1), relative: \(relative) }"
    }

    // MARK: - Drawing

    /**
     TODO: Add documentation
     */
    override func modify(path: CGMutablePath, prev: TPSVGInstruction?, prevStartPoint: CGPoint?) {
        if relative {
            let ref = path.currentPoint
            path.addQuadCurve(to: ref + end, control: ref + control1)
        } else {
            path.addQuadCurve(to: end, control: control1)
        }
    }

    // MARK: - Equatable

    /**
     TODO: Add documentation
     */
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
