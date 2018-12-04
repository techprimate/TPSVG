//
//  TPSVGInstrClosePath.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: Add documentation
 */
class TPSVGInstrClosePath: TPSVGInstruction {

    // MARK: - CustomStringConvertible

    /**
     TODO: Add documentation
     */
    override var description: String {
        return "TPSVGInstrClosePath {}"
    }

    // MARK: - CustomDebugStringConvertible

    /**
     TODO: Add documentation
     */
    override var debugDescription: String {
        return "TPSVGInstrClosePath {}"
    }

    // MARK: - Drawing

    /**
     TODO: Add documentation
     */
    override func modify(path: CGMutablePath, prev: TPSVGInstruction?, prevStartPoint: CGPoint?) {
        path.closeSubpath()
    }

    // MARK: - Equatable

    /**
     TODO: Add documentation
     */
    public static func == (lhs: TPSVGInstrClosePath, rhs: TPSVGInstrClosePath) -> Bool {
        return true
    }
}
