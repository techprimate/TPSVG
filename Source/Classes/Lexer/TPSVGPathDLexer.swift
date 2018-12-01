//
//  TPSVGPathDLexer.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGPathDLexer {

    private let raw: String

    init(raw: String) {
        self.raw = raw
    }

    func parse() -> [TPSVGInstruction] {
        return []
    }
}
