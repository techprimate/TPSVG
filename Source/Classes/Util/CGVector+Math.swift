//
//  CGVector+Math.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 02.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

public func * (lhs: CGVector, rhs: CGVector) -> CGVector {
    return CGVector(dx: lhs.dx * rhs.dx, dy: lhs.dy * rhs.dy)
}

public func * (lhs: CGVector, rhs: CGFloat) -> CGVector {
    return CGVector(dx: lhs.dx * rhs, dy: lhs.dy * rhs)
}

public func *= (lhs: inout CGVector, rhs: CGFloat) {
    lhs = CGVector(dx: lhs.dx * rhs, dy: lhs.dy * rhs)
}

public func abs(_ point: CGVector) -> CGVector {
    return CGVector(dx: abs(point.dx), dy: abs(point.dy))
}

public func sqrt(_ point: CGVector) -> CGVector {
    return CGVector(dx: sqrt(point.dx), dy: sqrt(point.dy))
}

public func pow(_ point: CGVector, _ exponent: CGFloat) -> CGVector {
    return CGVector(dx: pow(point.dx, exponent), dy: pow(point.dy, exponent))
}

extension CGVector {

    public func dot(_ other: CGVector) -> CGFloat {
        return self.dx * other.dx + self.dy * other.dy
    }

    public var length: CGFloat {
        return sqrt(dx * dx + dy * dy)
    }
}
