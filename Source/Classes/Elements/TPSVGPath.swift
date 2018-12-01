//
//  TPSVGPath.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGPath: TPSVGElement {

    private var instructions: [TPSVGInstruction]

    public init(classNames: [String] = [], instructions: [TPSVGInstruction] = []) {
        self.instructions = instructions
        super.init(classNames: classNames)
    }

    public override init?(attributes: [String: String]) {
        guard let rawD = attributes["d"] else {
            return nil
        }
        self.instructions = TPSVGPathDLexer(raw: rawD).parse()
        super.init(attributes: attributes)
    }

    // MARK: - Equatable

    public static func == (lhs: TPSVGPath, rhs: TPSVGPath) -> Bool {
        guard lhs.classNames == rhs.classNames else {
            return false
        }
        guard lhs.instructions == rhs.instructions else {
            return false
        }
        return true
    }
}
