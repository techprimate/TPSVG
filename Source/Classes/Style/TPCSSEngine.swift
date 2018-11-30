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
        return attributesPerName.map({ (name, attributes) -> TPSVGStyle in
            return createStyle(name: name, attributes: attributes)
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

    private func createStyle(name: Substring, attributes: [Substring: Substring]) -> TPSVGStyle {
        var fill: TPSVGColor?
        var stroke: TPSVGStroke?
        var font: TPSVGFont?

        return TPSVGStyle(name: String(name), fill: fill, stroke: stroke, font: font)
    }
}
