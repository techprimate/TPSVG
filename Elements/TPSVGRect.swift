//
//  TPSVGRect.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

public class TPSVGRect: TPSVGElement {

    private var origin: CGPoint
    private var size: CGSize

    public init(classNames: [String] = [], origin: CGPoint = .zero, size: CGSize = .zero) {
        self.origin = origin
        self.size = size
        super.init(classNames: classNames)
    }

    public override init?(attributes: [String : String]) {
        guard let rawX = attributes["x"], let x = TPSVGNumberParser.parse(rawX) else {
            return nil
        }
        guard let rawY = attributes["y"], let y = TPSVGNumberParser.parse(rawY) else {
            return nil
        }
        origin = CGPoint(x: x.value, y: y.value)

        guard let rawWidth = attributes["width"], let width = TPSVGNumberParser.parse(rawWidth) else {
            return nil
        }
        guard let rawHeight = attributes["height"], let height = TPSVGNumberParser.parse(rawHeight) else {
            return nil
        }
        size = CGSize(width: width.value, height: height.value)

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
}
