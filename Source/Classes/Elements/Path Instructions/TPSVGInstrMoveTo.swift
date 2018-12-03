//
//  TPSVGInstrMoveTo.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGInstrMoveTo: TPSVGInstruction {

    var point: CGPoint
    let relative: Bool

    init(point: CGPoint, relative: Bool = false) {
        self.point = point
        self.relative = relative
    }

    override var description: String {
        return "TPSVGInstrMoveTo {}"
    }

    override var debugDescription: String {
        return "TPSVGInstrMoveTo { point = \(point), relative: \(relative) }"
    }

    // MARK: - Drawing

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
