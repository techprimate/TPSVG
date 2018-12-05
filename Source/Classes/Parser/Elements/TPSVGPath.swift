//
//  TPSVGPath.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: Add documentation
 */
class TPSVGPath: TPSVGElement {

    /**
     TODO: Add documentation
     */
    internal var instructions: [TPSVGInstruction]

    /**
     TODO: Add documentation
     */
    internal init(classNames: [String] = [], inline: TPSVGStyle? = nil, instructions: [TPSVGInstruction] = []) {
        self.instructions = instructions
        super.init(classNames: classNames, inline: inline)
    }

    /**
     TODO: Add documentation
     */
    internal override init?(attributes: [String: String]) {
        if let rawD = attributes["d"] {
            self.instructions = TPSVGPathDLexer(raw: rawD).parse()
        } else {
            self.instructions = []
        }
        super.init(attributes: attributes)
    }

    // MARK: - Equatable

    /**
     TODO: Add documentation
     */
    internal static func == (lhs: TPSVGPath, rhs: TPSVGPath) -> Bool {
        guard lhs.classNames == rhs.classNames else {
            return false
        }
        guard lhs.instructions == rhs.instructions else {
            return false
        }
        return true
    }

    // MARK: - Drawing

    /**
     TODO: Add documentation
     */
    override func draw(in context: CGContext) {
        let path = CGMutablePath()

        var prev: TPSVGInstruction?
        var lastStartPoint: CGPoint?
        for inst in instructions {
            let point = path.isEmpty ? .zero : path.currentPoint
            inst.modify(path: path, prev: prev, prevStartPoint: lastStartPoint)
            lastStartPoint = point
            prev = inst
        }

        context.addPath(path)
        context.fillPath()
        context.addPath(path)
        context.strokePath()
    }

    // MARK: - CustomStringConvertible

    /**
     TODO: Add documentation
     */
    override internal var description: String {
        return "TPSVGPath {}"
    }

    // MARK: - CustomDebugStringConvertible

    /**
     TODO: Add documentation
     */
    override internal var debugDescription: String {
        return "TPSVGPath { classes: \(classNames), instructions: \(instructions) }"
    }

    // MARK: - Calculations

    /// :nodoc:
    override internal var bounds: CGRect {
        let path = CGMutablePath()

        var prev: TPSVGInstruction?
        var lastStartPoint: CGPoint?
        for inst in instructions {
            let point = path.isEmpty ? .zero : path.currentPoint
            inst.modify(path: path, prev: prev, prevStartPoint: lastStartPoint)
            lastStartPoint = point
            prev = inst
        }
        
        return path.boundingBoxOfPath
    }
}
