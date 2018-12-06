//
//  TPSVGNumberParser.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: Add documentation
 */
class TPSVGNumberParser {

    private static var numberRegex: TPRegex = {
        let sign = "(?:\\+|-)" // signs
        let digit = "[0-9]" // all digits
        let number = digit + "+" // at least one digit
        let decimal = "(?:" + number + "(?:\\." + number + ")?" + "|\\." + number + ")" // allows 123, 123.123, .123
        let unit = "(?:px|deg)" // allowed units
        let coordinate = "(" + sign + "?)(" + decimal + ")(" + unit + "?)" // always capture 3 groups

        do {
            return try TPRegex(pattern: coordinate)
        } catch {
            fatalError(error.localizedDescription)
        }
    }()

    /**
     TODO: Add documentation

     https://www.w3.org/TR/SVG/paths.html#PathDataBNF
     */
    internal static func parse(_ raw: String) -> (value: CGFloat, unit: String)? {
        guard !raw.isEmpty else {
            return nil
        }

        let comps = numberRegex.match(in: raw).captures
        guard comps.count == 3 else {
            fatalError("Should always read three components, even empty!")
        }
        let signValue: CGFloat = comps[0] == "-" ? -1 : 1
        guard let value = Double(comps[1]) else {
            return nil
        }
        let unitValue = comps[2]

        return (value: signValue * CGFloat(value), unit: unitValue)
    }

    /**
     TODO: Add documentation
     */
    internal static func parsePair(_ raw: String, separator: String = ",") -> (left: (value: CGFloat, unit: String),
                                                                             right: (value: CGFloat, unit: String))? {
        let comps = raw.components(separatedBy: separator)
        guard comps.count == 2 else {
            return nil
        }
        guard let left = parse(comps[0]), let right = parse(comps[1]) else {
            return nil
        }
        return (left: left, right: right)
    }
}
