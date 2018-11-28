//
//  TPSVG.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 28.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import Foundation

/**
 
 */
public class TPSVG {

    /**
     Initialize a `Data` with the contents of a `URL`.

     - Parameter url: The `URL` to read.

     - Throws: An error in the Cocoa domain, if `url` cannot be read.
     */
    public convenience init(contentsOf url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    // TODO: Documentation
    public convenience init(data: Data) throws {
        guard let raw = String(data: data, encoding: String.Encoding.utf8) else {
            throw TPSVGError.invalidData
        }
        self.init(raw: raw)
    }

    // TODO: Documentation
    public init(raw: String) {
        // TODO: Parsing of raw SVG String
    }
}
