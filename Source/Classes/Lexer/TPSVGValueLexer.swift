//
//  TPSVGValueLexer.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 05.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPSVGValueLexer {

    public static func parsePoints(from raw: String) -> [CGPoint] {
        let values = parseValues(from: raw)
        return getPoints(from: values)
    }

    /**
     TODO: Add documentation
     */
    public static func parseValues(from raw: String) -> [CGFloat] {
        var values: [CGFloat] = []
        var valueData: [Character] = []
        for rawC in raw {
            guard let dChar = DChars(rawValue: String(rawC).utf8CString[0]) else {
                valueData.append(rawC)
                continue
            }
            switch dChar {
            case .sign:
                if let parsed = TPSVGNumberParser.parse(String(valueData)) {
                    values.append(parsed.value)
                    valueData = [rawC]
                } else {
                    valueData = [rawC]
                }
            case .comma:
                if let parsed = TPSVGNumberParser.parse(String(valueData)) {
                    values.append(parsed.value)
                    valueData = []
                } else {
                    valueData = [rawC]
                }
            case .space:
                if let parsed = TPSVGNumberParser.parse(String(valueData)) {
                    values.append(parsed.value)
                }
                valueData = []
            case .dot:
                if valueData.contains(rawC), let parsed = TPSVGNumberParser.parse(String(valueData)) {
                    values.append(parsed.value)
                    valueData = [rawC]
                } else {
                    valueData.append(rawC)
                }
            default:
                break
            }
        }
        if !valueData.isEmpty {
            if let parsed = TPSVGNumberParser.parse(String(valueData)) {
                values.append(parsed.value)
            }
            valueData = []
        }
        return values
    }

    public static func getPoints(from values: [CGFloat]) -> [CGPoint] {
        return stride(from: 0, to: values.count, by: 2)
            .map({ (values[$0], values[$0 + 1]) })
            .map({ CGPoint(x: $0.0, y: $0.1 )})
    }
}
