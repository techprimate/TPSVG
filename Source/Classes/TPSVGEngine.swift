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

        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
    }
}

// MARK: - XMLParserDelegate

extension TPSVGEngine: XMLParserDelegate {

    // swiftlint:disable cyclomatic_complexity
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?,
                qualifiedName qName: String?, attributes attributeDict: [String: String] = [:]) {
        currentElement = elementName.lowercased()
        switch elementName.lowercased() {
        case "style":
            cssEngine = TPCSSEngine()
        case SVGSpecElement.circle.rawValue:
            if let circle = TPSVGCircle(attributes: attributeDict) {
                if let group = groups.top {
                    group.elements.append(circle)
                } else {
                    elements.append(circle)
                }
            }
        case SVGSpecElement.ellipse.rawValue:
            if let ellipse = TPSVGEllipse(attributes: attributeDict) {
                if let group = groups.top {
                    group.elements.append(ellipse)
                } else {
                    elements.append(ellipse)
                }
            }
        case SVGSpecElement.group.rawValue:
            groups.push(TPSVGGroup())
        case SVGSpecElement.path.rawValue:
            if let path = TPSVGPath(attributes: attributeDict) {
                if let group = groups.top {
                    group.elements.append(path)
                } else {
                    elements.append(path)
                }
            }
        case SVGSpecElement.polygon.rawValue:
            if let polygon = TPSVGPolygon(attributes: attributeDict) {
                if let group = groups.top {
                    group.elements.append(polygon)
                } else {
                    elements.append(polygon)
                }
            }
        case SVGSpecElement.polyline.rawValue:
            if let polyline = TPSVGPolyline(attributes: attributeDict) {
                if let group = groups.top {
                    group.elements.append(polyline)
                } else {
                    elements.append(polyline)
                }
            }
        case SVGSpecElement.rect.rawValue:
            if let rect = TPSVGRect(attributes: attributeDict) {
                if let group = groups.top {
                    group.elements.append(rect)
                } else {
                    elements.append(rect)
                }
            }
        case SVGSpecElement.text.rawValue:
            if let text = TPSVGText(attributes: attributeDict) {
                if let group = groups.top {
                    group.elements.append(text)
                } else {
                    elements.append(text)
                }
            }
        case SVGSpecElement.audio.rawValue,
             SVGSpecElement.canvas.rawValue,
             SVGSpecElement.foreign.rawValue,
             SVGSpecElement.iframe.rawValue,
             SVGSpecElement.tspan.rawValue,
             SVGSpecElement.video.rawValue:
            print("⚠️ [TPSVG] Unsupported tag found:", elementName)
        default:
            break
            //            print("💜 Start Element:", elementName, namespaceURI as Any, qName as Any, attributeDict)
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
