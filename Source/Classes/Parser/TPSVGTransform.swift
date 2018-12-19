//
//  TPSVGTransform.swift
//  TPKulaLib
//
//  Created by Philip Niedertscheider on 05.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

enum TPSVGTransform {

    // swiftlint:disable identifier_name
    case matrix(a: CGFloat, b: CGFloat, c: CGFloat, d: CGFloat, e: CGFloat, f: CGFloat)

    case translate(x: CGFloat, y: CGFloat)
    case translateX(distance: CGFloat)
    case translateY(distance: CGFloat)

    case scale(x: CGFloat, y: CGFloat)
    case scaleX(factor: CGFloat)
    case scaleY(factor: CGFloat)

    case rotate(angle: CGFloat)

    case skew(x: CGFloat, y: CGFloat)
    case skewX(angle: CGFloat)
    case skewY(angle: CGFloat)

    var affine: CGAffineTransform {
        switch self {
        case .matrix(let valA, let valB, let valC, let valD, let valE, let valF):
            return CGAffineTransform(a: valA, b: valB, c: valC, d: valD, tx: valE, ty: valF)
        case .translate(let x, let y):
            return CGAffineTransform(translationX: x, y: y)
        case .translateX(let distance):
            return CGAffineTransform(translationX: distance, y: 0)
        case .translateY(let distance):
            return CGAffineTransform(translationX: 0, y: distance)
        case .scale(let x, let y):
            return CGAffineTransform(scaleX: x, y: y)
        case .scaleX(let distance):
            return CGAffineTransform(scaleX: distance, y: 0)
        case .scaleY(let distance):
            return CGAffineTransform(scaleX: 0, y: distance)
        case .rotate(let angle):
            return CGAffineTransform(rotationAngle: angle)
        case .skew(let x, let y):
            return CGAffineTransform(a: 1, b: tan(y), c: tan(x), d: 0, tx: 0, ty: 0)
        case .skewX(let angle):
            return CGAffineTransform(a: 1, b: 0, c: tan(angle), d: 0, tx: 0, ty: 0)
        case .skewY(let angle):
            return CGAffineTransform(a: 1, b: tan(angle), c: 0, d: 0, tx: 0, ty: 0)
        }
    }
}

extension TPSVGTransform: Equatable {

    // swiftlint:disable cyclomatic_complexity
    public static func == (lhs: TPSVGTransform, rhs: TPSVGTransform) -> Bool {
        if case TPSVGTransform.matrix(let lhsA, let lhsB, let lhsC, let lhsD, let lhsE, let lhsF) = lhs,
            case TPSVGTransform.matrix(let rhsA, let rhsB, let rhsC, let rhsD, let rhsE, let rhsF) = rhs {
            return lhsA == rhsA && lhsB == rhsB && lhsC == rhsC && lhsD == rhsD && lhsE == rhsE && lhsF == rhsF
        }
        if case TPSVGTransform.translate(let lhsX, let lhsY) = lhs,
            case TPSVGTransform.translate(let rhsX, let rhsY) = rhs {
            return lhsX == rhsX && lhsY == rhsY
        }
        if case TPSVGTransform.translateX(let lhsValue) = lhs,
            case TPSVGTransform.translateX(let rhsValue) = rhs {
            return lhsValue == rhsValue
        }
        if case TPSVGTransform.translateY(let lhsValue) = lhs,
            case TPSVGTransform.translateY(let rhsValue) = rhs {
            return lhsValue == rhsValue
        }
        if case TPSVGTransform.scale(let lhsX, let lhsY) = lhs,
            case TPSVGTransform.scale(let rhsX, let rhsY) = rhs {
            return lhsX == rhsX && lhsY == rhsY
        }
        if case TPSVGTransform.scaleX(let lhsValue) = lhs,
            case TPSVGTransform.scaleX(let rhsValue) = rhs {
            return lhsValue == rhsValue
        }
        if case TPSVGTransform.scaleY(let lhsValue) = lhs,
            case TPSVGTransform.scaleY(let rhsValue) = rhs {
            return lhsValue == rhsValue
        }
        if case TPSVGTransform.rotate(let lhsValue) = lhs,
            case TPSVGTransform.rotate(let rhsValue) = rhs {
            return lhsValue == rhsValue
        }
        if case TPSVGTransform.skew(let lhsX, let lhsY) = lhs,
            case TPSVGTransform.skew(let rhsX, let rhsY) = rhs {
            return lhsX == rhsX && lhsY == rhsY
        }
        if case TPSVGTransform.skewX(let lhsValue) = lhs,
            case TPSVGTransform.skewX(let rhsValue) = rhs {
            return lhsValue == rhsValue
        }
        if case TPSVGTransform.skewY(let lhsValue) = lhs,
            case TPSVGTransform.skewY(let rhsValue) = rhs {
            return lhsValue == rhsValue
        }
        return false
    }
}
