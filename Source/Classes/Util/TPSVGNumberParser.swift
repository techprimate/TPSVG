//
//  TPSVGNumberParser.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGNumberParser {

    private static let formatter: NumberFormatter = {
        return NumberFormatter()
    }()

    public static func parse(_ raw: String) -> (value: CGFloat, unit: String)? {
        guard let regex = try? TPRegex(pattern: "^([\\d|,|\\.]*)(.*)$") else {
            return nil
        }
        let comps = regex.match(in: raw).captures

        if comps.count == 2 {
            guard let value = formatter.number(from: comps[0])?.doubleValue else {
                return nil
            }
            return (value: CGFloat(value), unit: comps[1])
        } else if comps.count == 1 {
            guard let value = formatter.number(from: comps[0])?.doubleValue else {
                return nil
            }
            return (value: CGFloat(value), unit: "")
        }
        return nil
    }
}
