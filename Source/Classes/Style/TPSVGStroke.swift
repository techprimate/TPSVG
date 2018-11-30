//
//  TPSVGStroke.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

public struct TPSVGStroke {

    public let color: UIColor
    public let width: CGFloat
    public let miterLimit: CGFloat

    public init(color: UIColor, width: CGFloat = 0, miterLimit: CGFloat = 0) {
        self.color = color
        self.width = width
        self.miterLimit = miterLimit
    }
}
