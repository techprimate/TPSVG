//
//  TPSVG.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 28.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import Foundation

/**
 TPSVG is the main class to parse an SVG file.

 Create a new instance with any of the given initalizers and the parsed result will be accessable as instance variables.
 Use any of these methods for converting the SVG vector:
 - TODO: add methods
 */
public class TPSVG {

    /**
     Loaded raw SVG
     */
    public private(set) var raw: String

    /**
     Parsed styles
     */
    public private(set) var styles = [TPSVGStyle]()

    /**
     Parsed paths
     */
    public private(set) var paths = [TPSVGElement]()

    /**
     Frame of view box/artboard
     */
    public private(set) var frame = CGRect.zero

    /**
     Origin of artboard
     */
    public private(set) var origin = CGPoint.zero

    /**
     Initialize a `TPSVG` with the contents of a `URL`.

     The content of the file should be in `UTF-8` encoding.

     - Parameter url: The `URL` to read.

     - Throws:
        - An error in the Cocoa domain, if `url` cannot be read.
        - An error thrown by `init(data: Data)`
     */
    public convenience init(contentsOf url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    /**
     Initalizes a `TPSVG` with the given raw SVG string.

     Then it parses the SVG and sets the instance variables `paths` and `styles` with the results.

     - Parameter raw: UTF-8 String

     - Throws:
        - Any error thrown by `init(data: Data)`
     */
    public convenience init(raw: String) throws {
        try self.init(data: Data(raw.utf8))
    }

    /**
     Initializes a `TPSVG` with the parsed UTF-8 raw string of `data`.

     - Parameter data: Data in UTF-8 encoding

     - Throws:
         - `TPSVGError.invalidData` if data cannot be parsed with UTF-8 encoding
     */
    public init(data: Data) throws {
        guard let raw = String(data: data, encoding: .utf8) else {
            throw TPSVGError.invalidData
        }
        self.raw = raw

        let engine = TPSVGEngine()
        engine.parse(data)

        self.styles = engine.styles
        self.paths = engine.elements
        self.origin = engine.origin
        self.frame = engine.frame
    }
}
