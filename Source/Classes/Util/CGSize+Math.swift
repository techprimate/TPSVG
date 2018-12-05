//
//  CGSize+Math.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 05.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

public func * (size: CGSize, factor: CGPoint) -> CGSize {
    return CGSize(width: size.width * factor.x, height: size.height * factor.y)
}

public func / (lhs: CGSize, rhs: CGSize) -> CGPoint {
    return CGPoint(x: lhs.width / rhs.width, y: lhs.height / rhs.height)
}
