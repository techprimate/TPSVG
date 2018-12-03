//
//  TPSVGLine.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: documentation
 */
class TPSVGLine: TPSVGElement {

    private var start: CGPoint
    private var end: CGPoint

    public init(classNames: [String] = [], start: CGPoint = .zero, end: CGPoint = .zero) {
        self.start = start
        self.end = end
        super.init(classNames: classNames)
    }

    public override init?(attributes: [String: String]) {
        guard let rawX1 = attributes["x1"], let x1 = TPSVGNumberParser.parse(rawX1) else {
            return nil
        }
        guard let rawY1 = attributes["y1"], let y1 = TPSVGNumberParser.parse(rawY1) else {
            return nil
        }
        start = CGPoint(x: x1.value, y: y1.value)
        guard let rawX2 = attributes["x2"], let x2 = TPSVGNumberParser.parse(rawX2) else {
            return nil
        }
        guard let rawY2 = attributes["y2"], let y2 = TPSVGNumberParser.parse(rawY2) else {
            return nil
        }
        end = CGPoint(x: x2.value, y: y2.value)

        super.init(attributes: attributes)
    }

    // MARK: - Drawing

    override func draw(in context: CGContext) {
        let path = CGMutablePath()
        path.move(to: start)
        path.move(to: end)
        context.addPath(path)
        context.fillPath()
        context.addPath(path)
        context.strokePath()
    }

    // MARK: - Equatable

    public static func == (lhs: TPSVGLine, rhs: TPSVGLine) -> Bool {
        guard lhs.classNames == rhs.classNames else {
            return false
        }
        guard lhs.start == rhs.start else {
            return false
        }
        guard lhs.end == rhs.end else {
            return false
        }
        return true
    }
}
