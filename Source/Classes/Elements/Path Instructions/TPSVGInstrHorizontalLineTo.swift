//
//  TPSVGInstrHorizontalLineTo.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: Add documentation
 */
class TPSVGInstrHorizontalLineTo: TPSVGInstruction {

    /**
     TODO: Add documentation
     */
    var length: CGFloat

    /**
     TODO: Add documentation
     */
    let relative: Bool

    /**
     TODO: Add documentation
     */
    init(length: CGFloat, relative: Bool = false) {
        self.length = length
        self.relative = relative
    }

    // MARK: - CustomStringConvertible

    /**
     TODO: Add documentation
     */
    override var description: String {
        return "TPSVGInstrHorizontalLineTo {}"
    }

    // MARK: - CustomDebugStringConvertible

    /**
     TODO: Add documentation
     */
    override var debugDescription: String {
        return "TPSVGInstrHorizontalLineTo { length: \(length), relative: \(relative) }"
    }

    // MARK: - Drawing

    /**
     Modifies a given path using the logic of this instruction.

     Adds a horizontal line to the given `path` starting and the current point.

     - Parameter path: Active path, which should be modified
     - Parameter prev: Previous instruction if exists, might be null.
     - Parameter prevStartPoint: Start point of previous instruction, used to calculate control points with relative values
     */
    override func modify(path: CGMutablePath, prev: TPSVGInstruction?, prevStartPoint: CGPoint?) {
        if relative {
            var end = path.currentPoint
            end.x += length
            path.addLine(to: end)
        } else {
            var end = path.currentPoint
            end.x = length
            path.addLine(to: end)
        }
    }

    // MARK: - Equatable

    /**
     TODO: Add documentation
     */
    public static func == (lhs: TPSVGInstrHorizontalLineTo, rhs: TPSVGInstrHorizontalLineTo) -> Bool {
        guard lhs.length == rhs.length else {
            return false
        }
        guard lhs.relative == rhs.relative else {
            return false
        }
        return true
    }
}
