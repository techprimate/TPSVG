//
//  TPSVGFont+CustomString.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: documentation
 */
extension TPSVGFont: CustomStringConvertible, CustomDebugStringConvertible {

    /**
     TODO: documentation
     */
    public var description: String {
        return String(format: "TPSVGFont { family: %@, size: %f }", family ?? "nil", size ?? 0)
    }

    /**
     TODO: documentation
     */
    public var debugDescription: String {
        return String(format: "TPSVGFont { family: %@, size: %f }", family ?? "nil", size ?? 0)
    }
}
