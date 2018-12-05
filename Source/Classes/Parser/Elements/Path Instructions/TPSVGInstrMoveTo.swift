//
//  TPSVGInstrMoveTo.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: Add documentation
 */
class TPSVGInstrMoveTo: TPSVGInstruction {

    /**
     TODO: Add documentation
     */
    var point: CGPoint

    /**
     TODO: Add documentation
     */
    let relative: Bool

    /**
     TODO: Add documentation
     */
    init(point: CGPoint, relative: Bool = false) {
        self.point = point
        self.relative = relative
    }

    // MARK: - Drawing

    /**
     Modifies a given path using the logic of this instruction.

     Moves the current point of the given `path`.

     - Parameter path: Active path, which should be modified
     - Parameter prev: Previous instruction if exists, might be null.
     - Parameter prevStartPoint: Start point of previous instruction, used to calculate control points with relative values
     */
    override func modify(path: CGMutablePath, prev: TPSVGInstruction?, prevStartPoint: CGPoint?) {
        if relative {
            let current = path.isEmpty ? .zero : path.currentPoint
            path.move(to: current + point)
        } else {
            path.move(to: point)
        }
    }
}

// MARK: - Equatable

extension TPSVGInstrMoveTo {

    /**
     TODO: Add documentation
     */
    internal static func == (lhs: TPSVGInstrMoveTo, rhs: TPSVGInstrMoveTo) -> Bool {
        guard lhs.point == rhs.point else {
            return false
        }
        guard lhs.relative == rhs.relative else {
            return false
        }
        return true
    }
}
