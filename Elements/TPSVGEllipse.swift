//
//  TPSVGEllipse.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGEllipse: TPSVGElement {

    override var kind: TPSVGElementKind {
        return .ellipse
    }

    public var center: CGPoint
    public var radius: CGVector

    public init(classNames: [String] = [], center: CGPoint = .zero, radius: CGVector = .zero) {
        self.center = center
        self.radius = radius
        super.init(classNames: classNames)
    }
}
