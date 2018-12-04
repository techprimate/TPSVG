//
//  TPSVGInstruction.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: Add documentation
 */
class TPSVGInstruction: Equatable, CustomStringConvertible, CustomDebugStringConvertible {

    // MARK: - Equatable

    /**
     TODO: Add documentation
     */
    public static func == (lhs: TPSVGInstruction, rhs: TPSVGInstruction) -> Bool {
        if let lhs = lhs as? TPSVGInstrMoveTo, let rhs = rhs as? TPSVGInstrMoveTo {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGInstrLineTo, let rhs = rhs as? TPSVGInstrLineTo {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGInstrHorizontalLineTo, let rhs = rhs as? TPSVGInstrHorizontalLineTo {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGInstrVerticalLineTo, let rhs = rhs as? TPSVGInstrVerticalLineTo {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGInstrCubicCurve, let rhs = rhs as? TPSVGInstrCubicCurve {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGInstrSmoothCubicCurve, let rhs = rhs as? TPSVGInstrSmoothCubicCurve {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGInstrQuadraticCurve, let rhs = rhs as? TPSVGInstrQuadraticCurve {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGInstrSmoothQuadraticCurve, let rhs = rhs as? TPSVGInstrSmoothQuadraticCurve {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGInstrEllipticalArcCurve, let rhs = rhs as? TPSVGInstrEllipticalArcCurve {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGInstrClosePath, let rhs = rhs as? TPSVGInstrClosePath {
            return lhs == rhs
        }
        return false
    }

    // MARK: - CustomStringConvertible {

    /**
     TODO: Add documentation
     */
    var description: String {
        return "TSVGInstruction {}"
    }

    // MARK: - CustomDebugStringConvertible

    /**
     TODO: Add documentation
     */
    var debugDescription: String {
        return "TSVGInstruction {}"
    }

    // MARK: - Drawing

    /**
     TODO: Add documentation
     */
    func modify(path: CGMutablePath, prev: TPSVGInstruction?, prevStartPoint: CGPoint?) {}
}
