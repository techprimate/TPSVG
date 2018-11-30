//
//  TPSVGPath.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGPath: TPSVGElement {

    override var kind: TPSVGElementKind {
        return .path
    }

    public init(classNames: [String] = [], d: [String] = []) {
        // TODO: save d
        super.init(classNames: classNames)
    }
}
