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

    /**
     TODO: Add documentation
     */
    private var start: CGPoint

    /**
     TODO: Add documentation
     */
    private var end: CGPoint

    /**
     TODO: Add documentation
     */
    internal init(classNames: [String] = [], start: CGPoint = .zero, end: CGPoint = .zero) {
        self.start = start
        self.end = end
        super.init(classNames: classNames)
    }

    /**
     TODO: Add documentation
     */
    internal override init?(attributes: [String: String]) {
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

    /**
     TODO: Add documentation
     */
    override func draw(in context: CGContext) {
        guard let path = createPath() else {
            return
        }
        context.addPath(path)
        context.fillPath()
        context.addPath(path)
        context.strokePath()
    }

    // MARK: - Equatable

    /**
     TODO: Add documentation
     */
    internal static func == (lhs: TPSVGLine, rhs: TPSVGLine) -> Bool {
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

    // MARK: - Calculations

    /// :nodoc:
    override internal var bounds: CGRect {
        return createPath()?.boundingBoxOfPath ?? .null
    }

    // MARK: - Path

    private func createPath() -> CGPath? {
        let path = CGMutablePath()
        path.move(to: start)
        path.addLine(to: end)
        return path.copy(using: &resolvedTransform)
    }
}
