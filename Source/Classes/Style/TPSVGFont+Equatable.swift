//
//  TPSVGFont+Equatable.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: documentation
 */
extension TPSVGFont: Equatable {

    /**
     TODO: documentation
     */
    internal static func == (lhs: TPSVGFont, rhs: TPSVGFont) -> Bool {
        guard lhs.family == rhs.family else {
            return false
        }
        guard lhs.size == rhs.size else {
            return false
        }
        return true
    }
}
