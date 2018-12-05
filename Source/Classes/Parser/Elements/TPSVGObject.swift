//
//  TPSVGObject.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 05.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//
class TPSVGObject {

    internal let origin: CGPoint
    internal let viewBox: CGRect

    internal init(attributes: [String: String]) {
        if let rawX = attributes["x"], let x = TPSVGNumberParser.parse(rawX),
            let rawY = attributes["y"], let y = TPSVGNumberParser.parse(rawY) {
            origin = CGPoint(x: x.value, y: y.value)
        } else {
            origin = .zero
        }

        if let rawViewBox = attributes["viewBox"] {
            let values = TPSVGValueLexer.parseValues(from: rawViewBox)
            self.viewBox = TPSVGValueLexer.getRect(from: values).first ?? .zero
        } else {
            self.viewBox = .zero
        }
    }
}
