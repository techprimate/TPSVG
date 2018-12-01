//
//  TPSVGInstrVerticalLineTo.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGInstrVerticalLineTo: TPSVGInstruction {

    var length: CGFloat
    let relative: Bool

    init(length: CGFloat, relative: Bool = false) {
        self.length = length
        self.relative = relative
    }

    // MARK: - CustomStringConvertible

    override var description: String {
        return "TPSVGInstrVerticalLineTo {}"
    }

    // MARK: - CustomDebugStringConvertible

    override var debugDescription: String {
        return "TPSVGInstrVerticalLineTo { length: \(length), relative: \(relative) }"
    }

    // MARK: - Drawing

    override func modify(context: CGContext) {
        if relative {
            var end = context.currentPointOfPath
            end.y += length
            context.move(to: end)
        } else {
            var end = context.currentPointOfPath
            end.y = length
            context.move(to: end)
        }
    }
    // MARK: - Equatable

    public static func == (lhs: TPSVGInstrVerticalLineTo, rhs: TPSVGInstrVerticalLineTo) -> Bool {
        guard lhs.length == rhs.length else {
            return false
        }
        guard lhs.relative == rhs.relative else {
            return false
        }
        return true
    }
}
