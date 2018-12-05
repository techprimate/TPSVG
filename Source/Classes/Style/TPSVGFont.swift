//
//  TPSVGFont.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: documentation
 */
internal struct TPSVGFont {

    /**
     TODO: documentation
     */
    internal var family: String?

    /**
     TODO: documentation
     */
    internal var size: CGFloat?

    /**
     TODO: documentation
     */
    internal init(family: String? = nil, size: CGFloat? = nil) {
        self.family = family
        self.size = size
    }
}
