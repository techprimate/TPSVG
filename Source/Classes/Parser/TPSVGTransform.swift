//
//  TPSVGTransform.swift
//  TPKulaLib
//
//  Created by Philip Niedertscheider on 05.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

enum TPSVGTransform {

    case matrix(values: CGAffineTransform)

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

}

extension TPSVGTransform: Equatable {

    // swiftlint:disable cyclomatic_complexity
    public static func == (lhs: TPSVGTransform, rhs: TPSVGTransform) -> Bool {
        if case TPSVGTransform.matrix(let lhsValue) = lhs, case TPSVGTransform.matrix(let rhsValue) = rhs {
            return lhsValue == rhsValue
        }
        if case TPSVGTransform.translate(let lhsX, let lhsY) = lhs, case TPSVGTransform.translate(let rhsX, let rhsY) = rhs {
            return lhsX == rhsX && lhsY == rhsY
        }
        if case TPSVGTransform.translateX(let lhsValue) = lhs, case TPSVGTransform.translateX(let rhsValue) = rhs {
            return lhsValue == rhsValue
        }
        if case TPSVGTransform.translateY(let lhsValue) = lhs, case TPSVGTransform.translateY(let rhsValue) = rhs {
            return lhsValue == rhsValue
        }
        if case TPSVGTransform.scale(let lhsX, let lhsY) = lhs, case TPSVGTransform.scale(let rhsX, let rhsY) = rhs {
            return lhsX == rhsX && lhsY == rhsY
        }
        if case TPSVGTransform.scaleX(let lhsValue) = lhs, case TPSVGTransform.scaleX(let rhsValue) = rhs {
            return lhsValue == rhsValue
        }
        if case TPSVGTransform.scaleY(let lhsValue) = lhs, case TPSVGTransform.scaleY(let rhsValue) = rhs {
            return lhsValue == rhsValue
        }
        if case TPSVGTransform.rotate(let lhsValue) = lhs, case TPSVGTransform.rotate(let rhsValue) = rhs {
            return lhsValue == rhsValue
        }
        if case TPSVGTransform.skew(let lhsX, let lhsY) = lhs, case TPSVGTransform.skew(let rhsX, let rhsY) = rhs {
            return lhsX == rhsX && lhsY == rhsY
        }
        if case TPSVGTransform.skewX(let lhsValue) = lhs, case TPSVGTransform.skewX(let rhsValue) = rhs {
            return lhsValue == rhsValue
        }
        if case TPSVGTransform.skewY(let lhsValue) = lhs, case TPSVGTransform.skewY(let rhsValue) = rhs {
            return lhsValue == rhsValue
        }
        return false
    }
}
