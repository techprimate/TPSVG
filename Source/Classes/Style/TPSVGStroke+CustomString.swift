//
//  TPSVGStroke+CustomString.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: documentation
 */
extension TPSVGStroke: CustomStringConvertible, CustomDebugStringConvertible {

    /**
     TODO: documentation
     */
    public var description: String {
        return String(format: "TPSVGStroke { color: %@, width: %f, miter limit: %f }", color?.hex ?? "nil", width ?? 0, miterLimit ?? 0)
    }

    /**
     TODO: documentation
     */
    public var debugDescription: String {
        return String(format: "TPSVGStroke { color: %@, width: %f, miter limit: %f }", color?.hex ?? "nil", width ?? 0, miterLimit ?? 0)
    }
}
