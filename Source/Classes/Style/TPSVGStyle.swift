//
//  TPSVGStyle.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: documentation
 */
class TPSVGStyle {

    /**
     TODO: documentation
     */
    let name: String

    /**
     TODO: documentation
     */
    var fill: TPSVGColor?

    /**
     TODO: documentation
     */
    var stroke: TPSVGStroke?

    /**
     TODO: documentation
     */
    var font: TPSVGFont?

    /**
     TODO: documentation
     */
    public init(name: String, fill: UIColor? = nil, stroke: TPSVGStroke? = nil, font: TPSVGFont? = nil) {
        self.name = name
        self.fill = fill
        self.stroke = stroke
        self.font = font
    }
}
