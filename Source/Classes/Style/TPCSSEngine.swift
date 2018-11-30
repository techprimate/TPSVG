//
//  TPCSSEngine.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

class TPCSSEngine {

    public var text: String = ""

    init() {}

    func parse() -> [TPSVGStyle] {
        let trimmed = text.replacingOccurrences(of: "^\\n|\\s|\\s+|\\s$", with: "", options: .regularExpression)

        var stylesRegex: TPRegex!
        do {
            stylesRegex = try TPRegex(pattern: "((?:[^\\{]*)\\{(?:[^\\}]*)\\})")
        } catch {
            fatalError(error.localizedDescription)
        }
        let parsedStyles = stylesRegex.match(in: trimmed).captures.compactMap(parseCSSElement(raw:))
        var attributesPerName: [Substring: [Substring: Substring]] = [:]
        for (names, attributes) in parsedStyles {
            for name in names {
                if var attrs = attributesPerName[name] {
                    for (key, value) in attributes {
                        attrs[key] = value
                    }
                    attributesPerName[name] = attrs
                } else {
                    attributesPerName[name] = attributes
                }
            }
        }
        return attributesPerName
            .map({ (name, attributes) -> TPSVGStyle in
                return createStyle(name: name, attributes: attributes)
            })
            .sorted(by: { (lhs, rhs) -> Bool in
                return lhs.name < rhs.name
            })
    }

    private func parseCSSElement(raw: String) -> (names: [Substring], attributes: [Substring: Substring])? {
        var elementRegex: TPRegex!
        do {
            elementRegex = try TPRegex(pattern: "(.*)\\{([^\\}]*)")
        } catch {
            fatalError(error.localizedDescription)
        }
        let groups = elementRegex.match(in: raw).captures

        if groups.count == 2 {
            return (names: groups[0].split(separator: ","), attributes: parseCssAttributes(raw: groups[1]))
        } else {
            print("Invalid groups count: ", groups)
            return nil
        }
    }

    private func parseCssAttributes(raw: String) -> [Substring: Substring] {
        var result: [Substring: Substring] = [:]

        for attribute in raw.split(separator: ";") {
            let comps = attribute.split(separator: ":")
            if comps.count == 2 {
                result[comps[0]] = comps[1]
            } else {
                print("Invalid CSS attribute:", attribute)
            }
        }

        return result
    }

    private lazy var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 4
        formatter.minimumFractionDigits = 0
        formatter.generatesDecimalNumbers = true
        return formatter
    }()

    private func createStyle(name: Substring, attributes: [Substring: Substring]) -> TPSVGStyle {
        // Fill

        var fill: TPSVGColor?
        if let rawFillColor = attributes["fill"] {
            let value = String(rawFillColor)
            switch value {
            case "none":
                fill = TPSVGColor.clear
            default:
                fill = TPSVGColor(hex: value)
            }
        }

        // Stroke

        var stroke: TPSVGStroke?
        var strokeColor: TPSVGColor?
        var strokeWidth: CGFloat?
        var strokeMiterLimit: CGFloat?
        if let rawStrokeColor = attributes["stroke"] {
            strokeColor = TPSVGColor(hex: String(rawStrokeColor))
        }
        if let rawWidth = attributes["stroke-width"] {
            let widthWithoutUnits = String(rawWidth).replacingOccurrences(of: "px|pt", with: "", options: .regularExpression)
            if let width = numberFormatter.number(from: widthWithoutUnits)?.doubleValue {
                strokeWidth = round(CGFloat(width * 10000)) / 10000 // Fix floating point error
            }
        }
        if let rawMiterLimit = attributes["stroke-miterlimit"] {
            let miterLimitWithoutUnits = String(rawMiterLimit).replacingOccurrences(of: "px|pt", with: "", options: .regularExpression)
            if let miterLimit = numberFormatter.number(from: miterLimitWithoutUnits)?.floatValue {
                strokeMiterLimit = round(CGFloat(miterLimit * 10000)) / 10000 // Fix floating point error
            }
        }
        if strokeColor != nil || strokeWidth != nil || strokeMiterLimit != nil {
            stroke = TPSVGStroke(color: strokeColor, width: strokeWidth, miterLimit: strokeMiterLimit)
        }

        // Font

        var font: TPSVGFont?
        var fontFamily: String?
        var fontSize: CGFloat?
        if let family = attributes["font-family"] {
            fontFamily = String(family).replacingOccurrences(of: "\\'|\\\"", with: "", options: .regularExpression)
        }
        if let rawSize = attributes["font-size"] {
            let sizeWithoutUnits = String(rawSize).replacingOccurrences(of: "px|pt", with: "", options: .regularExpression)
            if let size = numberFormatter.number(from: sizeWithoutUnits)?.floatValue {
                fontSize = CGFloat(size)
            }
        }
        if fontFamily != nil || fontSize != nil {
            font = TPSVGFont(family: fontFamily, size: fontSize)
        }

        return TPSVGStyle(name: String(name), fill: fill, stroke: stroke, font: font)
    }
}
