//
//  TPSVGPolygon.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGPolygon: TPSVGElement {

    public var points: [CGPoint]

    public init(classNames: [String] = [], points: [CGPoint] = []) {
        self.points = points
        super.init(classNames: classNames)
    }

    public override init?(attributes: [String : String]) {
        guard let rawPoints = attributes["points"] else {
            return nil
        }
        self.points = rawPoints.split(separator: " ").compactMap({ item -> CGPoint? in
            let comps = item.split(separator: ",")
            guard comps.count == 2 else {
                return nil
            }
            guard let x = TPSVGNumberParser.parse(String(comps[0])), let y = TPSVGNumberParser.parse(String(comps[1])) else {
                return nil
            }
            return CGPoint(x: x.value, y: y.value)
        })
        super.init(attributes: attributes)
    }

    // MARK: - Equatable

    public static func == (lhs: TPSVGPolygon, rhs: TPSVGPolygon) -> Bool {
        guard lhs.classNames == rhs.classNames else {
            return false
        }
        guard lhs.points == rhs.points else {
            return false
        }
        return true
    }
}
