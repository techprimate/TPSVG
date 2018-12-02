//
//  CGPoint+Math.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

public func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

public func pow(_ point: CGPoint, _ exponent: CGFloat) -> CGPoint {
    return CGPoint(x: pow(point.x, exponent), y: pow(point.y, exponent))
}
