//
//  TPSVGGroup.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//

class TPSVGGroup: TPSVGElement {

    public var elements: [TPSVGElement]

    public init(elements: [TPSVGElement] = []) {
        self.elements = elements
        super.init(classNames: [])
    }

    // MARK: - Equatable

    public static func == (lhs: TPSVGGroup, rhs: TPSVGGroup) -> Bool {
        guard lhs.classNames == rhs.classNames else {
            return false
        }
        guard lhs.elements == rhs.elements else {
            return false
        }
        return true
    }
}
