//
//  TPSVGText.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: Add documentation
 */
class TPSVGText: TPSVGElement {

    /**
     TODO: Add documentation
     */
    public var transform: String

    /**
     TODO: Add documentation
     */
    public var text: String

    /**
     TODO: Add documentation
     */
    public init(classNames: [String] = [], transform: String, text: String) {
        self.transform = transform
        self.text = text
        super.init(classNames: classNames)
    }

    /**
     TODO: Add documentation
     */
    public override init?(attributes: [String: String]) {
        guard let transform = attributes["transform"] else {
            return nil
        }
        self.transform = transform
        self.text = ""
        super.init(attributes: attributes)
    }

    // MARK: - Drawing

    /**
     TODO: Add documentation
     */
    override func draw(in context: CGContext) {
        // TODO: draw text
    }

    // MARK: - Equatable

    /**
     TODO: Add documentation
     */
    public static func == (lhs: TPSVGText, rhs: TPSVGText) -> Bool {
        guard lhs.classNames == rhs.classNames else {
            return false
        }
        guard lhs.transform == rhs.transform else {
            return false
        }
        guard lhs.text == rhs.text else {
            return false
        }
        return true
    }
}
