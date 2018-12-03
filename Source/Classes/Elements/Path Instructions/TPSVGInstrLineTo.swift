//
//  TPSVGInstrLineTo.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGInstrLineTo: TPSVGInstruction {

    var point: CGPoint
    let relative: Bool

    init(point: CGPoint, relative: Bool = false) {
        self.point = point
        self.relative = relative
    }

    // MARK: - CustomStringConvertible

    override var description: String {
        return "TPSVGInstrLineTo {}"
    }

    // MARK: - CustomDebugStringConvertible

    override var debugDescription: String {
        return "TPSVGInstrLineTo { point: \(point), relative: \(relative) }"
    }

    // MARK: - Drawing

    override func modify(context: CGMutablePath, prev: TPSVGInstruction?, prevStartPoint: CGPoint?) {
        if relative {
            context.addLine(to: context.currentPoint + point)
        } else {
            context.addLine(to: point)
        }
    }

    // MARK: - Equatable

    public static func == (lhs: TPSVGInstrLineTo, rhs: TPSVGInstrLineTo) -> Bool {
        guard lhs.point == rhs.point else {
            return false
        }
        guard lhs.relative == rhs.relative else {
            return false
        }
        return true
    }
}
