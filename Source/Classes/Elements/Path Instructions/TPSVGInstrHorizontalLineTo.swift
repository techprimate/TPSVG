//
//  TPSVGInstrHorizontalLineTo.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGInstrHorizontalLineTo: TPSVGInstruction {

    let length: CGFloat
    let relative: Bool

    init(length: CGFloat, relative: Bool = false) {
        self.length = length
        self.relative = relative
    }

    // MARK: - Equatable

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

