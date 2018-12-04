//
//  TPSVGStroke+Equatable.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: documentation
 */
extension TPSVGStroke: Equatable {

    /**
     TODO: documentation
     */
    public static func == (lhs: TPSVGStroke, rhs: TPSVGStroke) -> Bool {
        guard lhs.color?.hex == rhs.color?.hex else {
            return false
        }
        guard lhs.width == rhs.width else {
            return false
        }
        guard lhs.miterLimit == rhs.miterLimit else {
            return false
        }
        return true
    }
}
