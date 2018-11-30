//
//  TPSVGStyle.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

public class TPSVGStyle {

    let name: String
    let fill: TPSVGColor?
    let stroke: TPSVGStroke?
    let font: TPSVGFont?

    public init(name: String, fill: UIColor? = nil, stroke: TPSVGStroke? = nil, font: TPSVGFont? = nil) {
        self.name = name
        self.fill = fill
        self.stroke = stroke
        self.font = font
    }
}
