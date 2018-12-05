//
//  TPSVGStyle+Equatable.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: documentation
 */
extension TPSVGStyle: Equatable {

    /**
     TODO: documentation
     */
    internal static func == (lhs: TPSVGStyle, rhs: TPSVGStyle) -> Bool {
        guard lhs.name == rhs.name else {
            return false
        }
        guard lhs.fill?.hex == rhs.fill?.hex else {
            return false
        }
        guard lhs.stroke == rhs.stroke else {
            return false
        }
        guard lhs.font == rhs.font else {
            return false
        }
        return true
    }
}
