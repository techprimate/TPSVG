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

    /**
     TODO: Add documentation
     */
    override var description: String {
        return "TPSVGInstrMoveTo {}"
    }

    /**
     TODO: Add documentation
     */
    override var debugDescription: String {
        return "TPSVGInstrMoveTo { point = \(point), relative: \(relative) }"
    }

    // MARK: - Drawing

    /**
     TODO: Add documentation
     */
    override func modify(path: CGMutablePath, prev: TPSVGInstruction?, prevStartPoint: CGPoint?) {
        if relative {
            path.move(to: path.currentPoint + point)
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
    public static func == (lhs: TPSVGInstrMoveTo, rhs: TPSVGInstrMoveTo) -> Bool {
        guard lhs.point == rhs.point else {
            return false
        }
        guard lhs.relative == rhs.relative else {
            return false
        }
        return true
    }
}
