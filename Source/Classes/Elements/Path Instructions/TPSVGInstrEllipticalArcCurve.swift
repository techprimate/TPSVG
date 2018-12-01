//
//  TPSVGInstrEllipticalArcCurve.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGInstrEllipticalArcCurve: TPSVGInstruction {

    let end: CGPoint
    let radius: CGVector
    let xAxisRotation: CGFloat

    let largeArcFlag: Bool
    let sweepFlag: Bool

    let relative: Bool

    init(end: CGPoint, radius: CGVector, xAxisRotation: CGFloat, largeArcFlag: Bool, sweepFlag: Bool, relative: Bool = false) {
        self.end = end
        self.radius = radius
        self.xAxisRotation = xAxisRotation
        self.largeArcFlag = largeArcFlag
        self.sweepFlag = sweepFlag
        self.relative = relative
    }

    // MARK: - Equatable

    public static func == (lhs: TPSVGInstrEllipticalArcCurve, rhs: TPSVGInstrEllipticalArcCurve) -> Bool {
        guard lhs.end == rhs.end else {
            return false
        }
        guard lhs.radius == rhs.radius else {
            return false
        }
        guard lhs.xAxisRotation == rhs.xAxisRotation else {
            return false
        }
        guard lhs.largeArcFlag == rhs.largeArcFlag else {
            return false
        }
        guard lhs.sweepFlag == rhs.sweepFlag else {
            return false
        }
        guard lhs.relative == rhs.relative else {
            return false
        }
        return true
    }
}
