//
//  TPSVGEllipse.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGEllipse: TPSVGElement {

    public var center: CGPoint
    public var radius: CGVector

    public init(classNames: [String] = [], center: CGPoint = .zero, radius: CGVector = .zero) {
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

        guard let rawRadiusY = attributes["rx"], let radiusX = TPSVGNumberParser.parse(rawRadiusY) else {
            return nil
        }
        guard let rawRadiusX = attributes["ry"], let radiusY = TPSVGNumberParser.parse(rawRadiusX) else {
            return nil
        }
        self.radius = CGVector(dx: radiusX.value, dy: radiusY.value)

        super.init(attributes: attributes)
    }

    // MARK: - Equatable

    public static func == (lhs: TPSVGEllipse, rhs: TPSVGEllipse) -> Bool {
        guard lhs.classNames == rhs.classNames else {
            return false
        }
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
}
