//
//  TPSVGCircle.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGCircle: TPSVGElement {

    public var center: CGPoint
    public var radius: CGFloat

    public init(classNames: [String] = [], center: CGPoint = .zero, radius: CGFloat = 0) {
        self.center = center
        self.radius = radius
        super.init(classNames: classNames)
    }

    public override init?(attributes: [String : String]) {
        guard let rawX = attributes["cx"], let x = TPSVGNumberParser.parse(rawX) else {
            return nil
        }
        guard let rawY = attributes["cy"], let y = TPSVGNumberParser.parse(rawY) else {
            return nil
        }
        center = CGPoint(x: x.value, y: y.value)

        guard let rawRadius = attributes["r"], let radius = TPSVGNumberParser.parse(rawRadius) else {
            return nil
        }
        self.radius = radius.value

        super.init(attributes: attributes)
    }

    // MARK: - Equatable

    public static func == (lhs: TPSVGCircle, rhs: TPSVGCircle) -> Bool {
        guard lhs.classNames == rhs.classNames else {
            return false
        }
        guard lhs.center == rhs.center else {
            return false
        }
        guard lhs.radius == rhs.radius else {
            return false
        }
        return true
    }

    // MARK: - Drawing

    override func draw(in context: CGContext) {
        let path = UIBezierPath(ovalIn: CGRect(x: center.x - radius,
                                               y: center.y - radius,
                                               width: 2 * radius,
                                               height: 2 * radius))
        context.addPath(path.cgPath)
        context.fillPath()
        context.addPath(path.cgPath)
        context.strokePath()
    }

    // MARK: - CustomStringConvertible

    override public var description: String {
        return String(format: "TPSVGCircle {}")
    }

    // MARK: - CustomDebugStringConvertible

    override public var debugDescription: String {
        return String(format: "TPSVGCircle { classes: %@, styles: %@, center: %@, radius: %f }",
                      classNames.joined(separator: ", "),
                      styles.map({ $0.name }).joined(separator: ", "),
                      center.debugDescription,
                      radius)
    }
}
