//
//  TPSVGInstrClosePath.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGInstrClosePath: TPSVGInstruction {

    // MARK: - CustomStringConvertible

    override var description: String {
        return "TPSVGInstrClosePath {}"
    }

    // MARK: - CustomDebugStringConvertible

    override var debugDescription: String {
        return "TPSVGInstrClosePath {}"
    }

    // MARK: - Drawing

    override func modify(context: CGContext) {
        context.closePath()
    }

    // MARK: - Equatable

    public static func == (lhs: TPSVGInstrClosePath, rhs: TPSVGInstrClosePath) -> Bool {
        return true
    }
}
