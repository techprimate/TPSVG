//
//  TPSVGStyle+Equatable.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

extension TPSVGStyle: Equatable {

    public static func == (lhs: TPSVGStyle, rhs: TPSVGStyle) -> Bool {
        guard lhs.name == rhs.name else {
            return false
        }
        guard lhs.fill == rhs.fill else {
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
