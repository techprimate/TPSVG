//
//  TPSVGPath.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGPath: TPSVGElement {

    public init(classNames: [String] = [], d: [String] = []) {
        // TODO: save d
        super.init(classNames: classNames)
    }

    public override init?(attributes: [String : String]) {
        super.init(attributes: attributes)
    }

    // MARK: - Equatable

    public static func == (lhs: TPSVGPath, rhs: TPSVGPath) -> Bool {
        guard lhs.classNames == rhs.classNames else {
            return false
        }
        return true
    }
}
