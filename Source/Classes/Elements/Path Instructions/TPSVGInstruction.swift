//
//  TPSVGInstruction.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGInstruction: Equatable {

    // MARK: - Equatable
    
    public static func == (lhs: TPSVGInstruction, rhs: TPSVGInstruction) -> Bool {
        if let lhs = lhs as? TPSVGInstrClosePath, let rhs = rhs as? TPSVGInstrClosePath {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGInstrMoveTo, let rhs = rhs as? TPSVGInstrMoveTo {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGInstrLineTo, let rhs = rhs as? TPSVGInstrLineTo {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGInstrCubicBezierCurve, let rhs = rhs as? TPSVGInstrCubicBezierCurve {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGInstrEllipticalArcCurve, let rhs = rhs as? TPSVGInstrEllipticalArcCurve {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGInstrQuadraticBezierCurve, let rhs = rhs as? TPSVGInstrQuadraticBezierCurve {
            return lhs == rhs
        }
        return false
    }
}
