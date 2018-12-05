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

    /// :nodoc:
    var description: String {
        return String(describing: type(of: self)) + " {}"
    }

    // MARK: - CustomDebugStringConvertible

    /// :nodoc:
    var debugDescription: String {
        return String(describing: type(of: self)) + " {}"
    }

    // MARK: - Drawing

    /**
     Modifies a given path using the logic of this instruction.

     Subclasses should overwrite this method to implement instruction specific modification.

     - Parameter path: Active path, which should be modified
     - Parameter prev: Previous instruction if exists, might be null.
     - Parameter prevStartPoint: Start point of previous instruction, used to calculate control points with relative values
     */
    func modify(path: CGMutablePath, prev: TPSVGInstruction?, prevStartPoint: CGPoint?) {}
}
