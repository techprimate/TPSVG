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

    /**
     TODO: Add documentation
     */
    private var currentElement: String?

    /**
     TODO: Add documentation
     */
    private var groups = TPStack<TPSVGGroup>()

    /**
     TODO: Add documentation
     */
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

        elements.forEach({ resolveStyles(element: $0, parent: nil) })
    }

    /**
     TODO: Add documentation
     */
    private func resolveStyles(element: TPSVGElement, parent: TPSVGElement?) {
        let inlineStyles = element.styles
        let stylesToSearch = inlineStyles + styles
        element.styles = element.classNames.compactMap({ className in
            if let style = stylesToSearch.first(where: { $0.name == "." + className }) {
                return style
            } else {
                print("⚠️ Failed to find style with class: " + className)
            }
            return nil
        })
        element.resolvedStyle = element.styles.reduce(nil, mergeOverwrite(style:with:))
        element.resolvedStyle = element.inheritedStyles.reduce(element.resolvedStyle, mergeOverwrite(style:with:))
        element.resolvedStyle = mergeOverwrite(style: element.resolvedStyle, with: parent?.resolvedStyle)
        element.resolvedStyle = mergeOverwrite(style: element.resolvedStyle, with: element.inline)

        if let groupElement = element as? TPSVGGroup {
            groupElement.elements.forEach { (el) in
                el.inheritedStyles = groupElement.inheritedStyles + groupElement.styles
            }
            groupElement.elements.forEach({ resolveStyles(element: $0, parent: groupElement) })
        }
    }

    private func mergeOverwrite(style: TPSVGStyle?, with other: TPSVGStyle?) -> TPSVGStyle? {
        if style == nil && other == nil {
            return nil
        } else if style == nil {
            return other
        } else if other == nil {
            return style
        }

        var fillColor = style?.fill
        var stroke = style?.stroke
        var font = style?.font

        if let otherFill = other?.fill {
            fillColor = otherFill
        }
        if let otherStroke = other?.stroke {
            if stroke == nil {
                stroke = otherStroke
            } else {
                if let otherStrokeColor = otherStroke.color {
                    stroke?.color = otherStrokeColor
                }
                if let otherStrokeWidth = otherStroke.width {
                    stroke?.width = otherStrokeWidth
                }
                if let otherStrokeMiterLimit = otherStroke.miterLimit {
                    stroke?.miterLimit = otherStrokeMiterLimit
                }
            }
        }
        if let otherFont = other?.font {
            if font == nil {
                font = otherFont
            } else {
                if let otherFontSize = otherFont.size {
                    font?.size = otherFontSize
                }
                if let otherFontFamily = otherFont.family {
                    font?.family = otherFontFamily
                }
            }
        }

        return TPSVGStyle(name: style?.name ?? other?.name ?? "?", fill: fillColor, stroke: stroke, font: font)
    }
}

// MARK: - XMLParserDelegate

extension TPSVGEngine: XMLParserDelegate {

    /// :nodoc:
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?,
                qualifiedName qName: String?, attributes attributeDict: [String: String] = [:]) {
        currentElement = elementName.lowercased()
        var element: TPSVGElement?
        switch elementName.lowercased() {
        case SVGSpecElement.svg.rawValue:
            let svgObject = TPSVGObject(attributes: attributeDict)
            self.origin = svgObject.origin
            self.frame = svgObject.viewBox
        case SVGSpecElement.style.rawValue:
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

    /// :nodoc:
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        switch elementName.lowercased() {
        case SVGSpecElement.style.rawValue:
            styles = cssEngine?.parse() ?? []
        case SVGSpecElement.group.rawValue:
            if let group = groups.pop() {
                elements.append(group)
            }
        default:
            break
        }
    }

    /// :nodoc:
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case SVGSpecElement.style.rawValue:
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

    /// :nodoc:
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("☠️ Parse Error:", parseError)
    }

    /// :nodoc:
    func parser(_ parser: XMLParser, validationErrorOccurred validationError: Error) {
        print("☠️ Validation Error:", validationError)
    }
}
