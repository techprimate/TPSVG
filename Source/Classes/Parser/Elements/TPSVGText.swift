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
    internal var transform: String

    /**
     TODO: Add documentation
     */
    internal var text: String

    /**
     TODO: Add documentation
     */
    internal init(classNames: [String] = [], transform: String, text: String) {
        self.transform = transform
        self.text = text
        super.init(classNames: classNames)
    }

    /**
     TODO: Add documentation
     */
    internal override init?(attributes: [String: String]) {
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
    internal static func == (lhs: TPSVGText, rhs: TPSVGText) -> Bool {
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

    // MARK: - Calculations

    /// :nodoc:
    override internal var bounds: CGRect {
        return CGRect.zero
    }
}
