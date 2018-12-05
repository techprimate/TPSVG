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
internal struct TPSVGStroke {

    /**
     TODO: documentation
     */
    internal var color: UIColor?

    /**
     TODO: documentation
     */
    internal var width: CGFloat?

    /**
     TODO: documentation
     */
    internal var miterLimit: CGFloat?

    /**
     TODO: documentation
     */
    internal init(color: UIColor? = nil, width: CGFloat? = nil, miterLimit: CGFloat? = nil) {
        self.color = color
        self.width = width
        self.miterLimit = miterLimit
    }
}
