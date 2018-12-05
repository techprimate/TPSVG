//
//  TPSVGStroke.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: documentation
 */
public struct TPSVGStroke {

    /**
     TODO: documentation
     */
    public var color: UIColor?

    /**
     TODO: documentation
     */
    public var width: CGFloat?

    /**
     TODO: documentation
     */
    public var miterLimit: CGFloat?

    /**
     TODO: documentation
     */
    public init(color: UIColor? = nil, width: CGFloat? = nil, miterLimit: CGFloat? = nil) {
        self.color = color
        self.width = width
        self.miterLimit = miterLimit
    }
}
