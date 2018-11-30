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
public class TPSVGStyle {

    /**
     TODO: documentation
     */
    let name: String

    /**
     TODO: documentation
     */
    let fill: TPSVGColor?

    /**
     TODO: documentation
     */
    let stroke: TPSVGStroke?

    /**
     TODO: documentation
     */
    let font: TPSVGFont?

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
