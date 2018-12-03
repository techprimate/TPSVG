//
//  TPSVGRect.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

public class TPSVGRect: TPSVGElement {

    public private(set) var origin: CGPoint
    public private(set) var size: CGSize

    public init(classNames: [String] = [], origin: CGPoint = .zero, size: CGSize = .zero) {
        self.origin = origin
        self.size = size
        super.init(classNames: classNames)
    }

    public override init?(attributes: [String: String]) {
        origin = .zero
        size = .zero

        if let rawX = attributes["x"], let x = TPSVGNumberParser.parse(rawX) {
            origin.x = x.value
        }
        if let rawY = attributes["y"], let y = TPSVGNumberParser.parse(rawY) {
            origin.y = y.value
        }

        if let rawWidth = attributes["width"], let width = TPSVGNumberParser.parse(rawWidth) {
            size.width = width.value
        }
        if let rawHeight = attributes["height"], let height = TPSVGNumberParser.parse(rawHeight) {
            size.height = height.value
        }
        super.init(attributes: attributes)
    }

    // MARK: - Equatable

    public static func == (lhs: TPSVGRect, rhs: TPSVGRect) -> Bool {
        guard lhs.classNames == rhs.classNames else {
            return false
        }
        guard lhs.origin == rhs.origin else {
            return false
        }
        guard lhs.size == rhs.size else {
            return false
        }
        return true
    }

    // MARK: - Rendering

    override public func draw(in context: CGContext) {
        context.fill(CGRect(origin: origin, size: size))
        context.stroke(CGRect(origin: origin, size: size))
    }
}
