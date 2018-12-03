//
//  TPSVGPath.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGPath: TPSVGElement {

    public var instructions: [TPSVGInstruction]

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

    // MARK: - Drawing

    override func draw(in context: CGContext) {
        let path = CGMutablePath()

        var prev: TPSVGInstruction?
        var lastStartPoint: CGPoint?
        for inst in instructions {
            let point = path.currentPoint
            inst.modify(context: path, prev: prev, prevStartPoint: lastStartPoint)
            lastStartPoint = point
            prev = inst
        }

        context.addPath(path)
        context.fillPath()
        context.addPath(path)
        context.strokePath()
    }

    // MARK: - CustomStringConvertible

    override public var description: String {
        return "TPSVGPath {}"
    }

    // MARK: - CustomDebugStringConvertible

    override public var debugDescription: String {
        return "TPSVGPath { classes: \(classNames), instructions: \(instructions) }"
    }
}
