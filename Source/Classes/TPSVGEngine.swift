//
//  TPSVGEngine.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: documentation
 */
class TPSVGEngine: NSObject {

    /**
     A list of all styles parsed by this engine.
     */
    public private(set) var styles = [TPSVGStyle]()

    /**
     An ordered list of all paths parsed by this engine.
     */
    public private(set) var elements = [TPSVGElement]()

    /**
     Frame of view box/artboard
     */
    public private(set) var frame = CGRect.zero

    /**
     Origin of artboard
     */
    public private(set) var origin = CGPoint.zero

    // MARK: - Parsing

    private var currentElement: String?
    private var groups = TPStack<TPSVGGroup>()
    private var cssEngine: TPCSSEngine?

    /**
     Reads the given data using an XML Parser and creates `styles` and `paths` from it.

     Calling this method discards previously parsed data.
     */
    func parse(_ data: Data) {
        styles = []
        elements = []
        frame = .zero
        origin = .zero

        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()

        elements.forEach(resolveStyles(element:))
    }

    private func resolveStyles(element: TPSVGElement) {
        element.styles = element.classNames.compactMap({ className in
            return styles.first(where: { style -> Bool in
                return style.name == "." + className
            })
        })
        if let groupElement = element as? TPSVGGroup {
            groupElement.elements.forEach(resolveStyles(element:))
        }
    }
}

// MARK: - XMLParserDelegate

extension TPSVGEngine: XMLParserDelegate {

    // swiftlint:disable cyclomatic_complexity
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?,
                qualifiedName qName: String?, attributes attributeDict: [String: String] = [:]) {
        currentElement = elementName.lowercased()
        var element: TPSVGElement?
        switch elementName.lowercased() {
        case "svg":
            parseSVG(attributes: attributeDict)
        case "style":
            cssEngine = TPCSSEngine()
        case SVGSpecElement.circle.rawValue:
            element = TPSVGCircle(attributes: attributeDict)
        case SVGSpecElement.ellipse.rawValue:
            element = TPSVGEllipse(attributes: attributeDict)
        case SVGSpecElement.group.rawValue:
            groups.push(TPSVGGroup())
        case SVGSpecElement.line.rawValue:
            element = TPSVGLine(attributes: attributeDict)
        case SVGSpecElement.path.rawValue:
            element = TPSVGPath(attributes: attributeDict)
        case SVGSpecElement.polygon.rawValue:
            element = TPSVGPolygon(attributes: attributeDict)
        case SVGSpecElement.polyline.rawValue:
            element = TPSVGPolyline(attributes: attributeDict)
        case SVGSpecElement.rect.rawValue:
            element = TPSVGRect(attributes: attributeDict)
        case SVGSpecElement.text.rawValue:
            element = TPSVGText(attributes: attributeDict)
        case SVGSpecElement.audio.rawValue,
             SVGSpecElement.canvas.rawValue,
             SVGSpecElement.foreign.rawValue,
             SVGSpecElement.iframe.rawValue,
             SVGSpecElement.tspan.rawValue,
             SVGSpecElement.video.rawValue:
            print("⚠️ [TPSVG] Unsupported tag found:", elementName)
        default:
            break
        }

        if let elem = element {
            if let group = groups.top {
                group.elements.append(elem)
            } else {
                elements.append(elem)
            }
        }
    }

    private func parseSVG(attributes: [String: String]) {
        if let rawX = attributes["x"], let x = TPSVGNumberParser.parse(rawX),
            let rawY = attributes["y"], let y = TPSVGNumberParser.parse(rawY) {
            origin = CGPoint(x: x.value, y: y.value)
        }

        if let rawViewBox = attributes["viewBox"] {
            let comps = rawViewBox.components(separatedBy: " ")
            if comps.count == 4,
                let x = TPSVGNumberParser.parse(comps[0]),
                let y = TPSVGNumberParser.parse(comps[1]),
                let width = TPSVGNumberParser.parse(comps[2]),
                let height = TPSVGNumberParser.parse(comps[3]) {
                frame = CGRect(x: x.value,
                               y: y.value,
                               width: width.value,
                               height: height.value)
            }
        }
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        switch elementName.lowercased() {
        case "style":
            styles = cssEngine?.parse() ?? []
        case SVGSpecElement.group.rawValue:
            if let group = groups.pop() {
                elements.append(group)
            }
        default:
            break
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "style":
            guard let css = cssEngine else {
                return
            }
            css.text += string
        case SVGSpecElement.text.rawValue:
            guard let textElement = elements.last as? TPSVGText else {
                return
            }
            if string != "\n" {
                textElement.text += string
            }
        default:
            break
        }
    }

    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("☠️ Parse Error:", parseError)
    }

    func parser(_ parser: XMLParser, validationErrorOccurred validationError: Error) {
        print("☠️ Validation Error:", validationError)
    }
}
