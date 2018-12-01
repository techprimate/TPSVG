//
//  TPSVGInstrMoveTo.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGInstrMoveTo: TPSVGInstruction {

    let point: CGPoint
    let relative: Bool

    init(point: CGPoint, relative: Bool) {
        self.point = point
        self.relative = relative
    }
    
    // MARK: - Equatable

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
