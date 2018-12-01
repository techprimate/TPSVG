//
//  TPSVGInstrSmoothCubicCurve.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGInstrSmoothCubicCurve: TPSVGInstruction {

    let end: CGPoint
    let control2: CGPoint
    let relative: Bool

    init(end: CGPoint, control2: CGPoint, relative: Bool = false) {
        self.end = end
        self.control2 = control2
        self.relative = relative
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
