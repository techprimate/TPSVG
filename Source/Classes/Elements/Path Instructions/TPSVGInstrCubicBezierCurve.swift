//
//  TPSVGInstrCubicBezierCurve.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGInstrCubicBezierCurve: TPSVGInstruction {

    let end: CGPoint
    let control1: CGPoint
    let control2: CGPoint

    init(end: CGPoint, control1: CGPoint, control2: CGPoint) {
        self.end = end
        self.control1 = control1
        self.control2 = control2
    }

    // MARK: - Equatable

    public static func == (lhs: TPSVGInstrCubicBezierCurve, rhs: TPSVGInstrCubicBezierCurve) -> Bool {
        guard lhs.end == rhs.end else {
            return false
        }
        guard lhs.control1 == rhs.control1 else {
            return false
        }
        guard lhs.control2 == rhs.control2 else {
            return false
        }
        return true
    }
}
