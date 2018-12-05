//
//  TPSVGStyle+CustomString.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: documentation
 */
extension TPSVGStyle: CustomStringConvertible, CustomDebugStringConvertible {

    /**
     TODO: documentation
     */
    internal var description: String {
        return String(format: "TPSVGStyle { name: %@ }", name)
    }

    /**
     TODO: documentation
     */
    internal var debugDescription: String {
        return String(format: "TPSVGStyle{ name: %@, fill: %@, stroke: %@, font: %@ }",
                      name, fill?.hex ?? "nil", stroke?.debugDescription ?? "nil", font?.debugDescription ?? "nil")
    }
}
