//
//  TPSVGInstrQuadraticCurve.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGInstrQuadraticCurve: TPSVGInstruction {

    let end: CGPoint
    let control1: CGPoint
    let control2: CGPoint
    let relative: Bool

    init(end: CGPoint, control1: CGPoint, control2: CGPoint, relative: Bool = false) {
        self.end = end
        self.control1 = control1
        self.control2 = control2
        self.relative = relative
    }

    // MARK: - Equatable

    public static func == (lhs: TPSVGInstrQuadraticCurve, rhs: TPSVGInstrQuadraticCurve) -> Bool {
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
