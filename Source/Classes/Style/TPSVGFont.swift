//
//  TPSVGFont.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

public struct TPSVGFont {

    public let family: String?
    public let size: CGFloat?

    public init(family: String? = nil, size: CGFloat? = nil) {
        self.family = family
        self.size = size
    }
}
