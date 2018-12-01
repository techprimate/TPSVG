//
//  TPSVGInstrClosePath.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGInstrClosePath: TPSVGInstruction {

    // MARK: - Equatable
    
    public static func == (lhs: TPSVGInstrClosePath, rhs: TPSVGInstrClosePath) -> Bool {
        return true
    }
}
