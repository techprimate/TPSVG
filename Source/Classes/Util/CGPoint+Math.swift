//
//  CGPoint+Math.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: Add documentation
 */
public func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

/**
 TODO: Add documentation
 */
public func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
}

/**
 TODO: Add documentation
 */
public func * (point: CGPoint, factor: Int) -> CGPoint {
    return point * CGFloat(factor)
}

/**
 TODO: Add documentation
 */
public func * (factor: Int, point: CGPoint) -> CGPoint {
    return point * CGFloat(factor)
}

/**
 TODO: Add documentation
 */
public func * (point: CGPoint, factor: Double) -> CGPoint {
    return point * CGFloat(factor)
}

/**
 TODO: Add documentation
 */
public func * (factor: Double, point: CGPoint) -> CGPoint {
    return point * CGFloat(factor)
}

/**
 TODO: Add documentation
 */
public func * (factor: CGFloat, point: CGPoint) -> CGPoint {
    return CGPoint(x: point.x * factor, y: point.y * factor)
}

/**
 TODO: Add documentation
 */
public func * (point: CGPoint, factor: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * factor, y: point.y * factor)
}

/**
 TODO: Add documentation
 */
public func pow(_ point: CGPoint, _ exponent: CGFloat) -> CGPoint {
    return CGPoint(x: pow(point.x, exponent), y: pow(point.y, exponent))
}
