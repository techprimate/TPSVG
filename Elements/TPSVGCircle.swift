//
//  TPSVGCircle.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGCircle: TPSVGElement {

    override var kind: TPSVGElementKind {
        return .circle
    }

    public var center: CGPoint
    public var radius: CGFloat

    public init(classNames: [String] = [], center: CGPoint = .zero, radius: CGFloat = 0) {
        self.center = center
        self.radius = radius
        super.init(classNames: classNames)
    }
}
