//
//  TPSVGElement.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: documentation
 */
public class TPSVGElement: Equatable {

    /**
     TODO: documentation
     */
    var kind: TPSVGElementKind {
        return .none
    }

    /**
     TODO: documentation
     */
    public var classNames: [String]

    /**
     TODO: documentation
     */
    public init(classNames: [String]) {
        self.classNames = classNames
    }

    public init?(attributes: [String: String]) {
        self.classNames = attributes["class"]?.split(separator: " ").map({ String($0) }) ?? []
    }

    /**
     TODO: documentation
     */
    public static func == (lhs: TPSVGElement, rhs: TPSVGElement) -> Bool {
        if let lhs = lhs as? TPSVGCircle, let rhs = rhs as? TPSVGCircle {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGEllipse, let rhs = rhs as? TPSVGEllipse {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGPath, let rhs = rhs as? TPSVGPath {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGPolygon, let rhs = rhs as? TPSVGPolygon {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGPolyline, let rhs = rhs as? TPSVGPolyline {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGRect, let rhs = rhs as? TPSVGRect {
            return lhs == rhs
        }
        if let lhs = lhs as? TPSVGText, let rhs = rhs as? TPSVGText {
            return lhs == rhs
        }

        return lhs.kind == rhs.kind
    }
}
