//
//  TPSVGPolyline.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGPolyline: TPSVGElement {

    override var kind: TPSVGElementKind {
        return .polyline
    }

    public var points: [CGPoint]

    public init(classNames: [String] = [], points: [CGPoint] = []) {
        self.points = points
        super.init(classNames: classNames)
    }
}
