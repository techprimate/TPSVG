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
    public private(set) var paths = [TPSVGPath]()

    // MARK: - Parsing

    private var currentElement: String?
    private var cssEngine: TPCSSEngine?

    /**
     Reads the given data using an XML Parser and creates `styles` and `paths` from it.

     Calling this method discards previously parsed data.
     */
    func parse(_ data: Data) {
        styles = []
        paths = []

        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
    }
}

// MARK: - XMLParserDelegate

extension TPSVGEngine: XMLParserDelegate {

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?,
                qualifiedName qName: String?, attributes attributeDict: [String: String] = [:]) {
        currentElement = elementName.lowercased()
        switch elementName.lowercased() {
        case "style":
            cssEngine = TPCSSEngine()
        default:
            break
//            print("💜 Start Element:", elementName, namespaceURI as Any, qName as Any, attributeDict)
        }
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        currentElement = nil
        switch elementName.lowercased() {
        case "style":
            styles = cssEngine?.parse() ?? []
        default:
            break
//            print("💜 End Element:", elementName, namespaceURI as Any, qName as Any)
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "style":
            guard let css = cssEngine else {
                return
            }
            css.text += string
        default:
            break
//            print("💜 Found characters:", string)
        }
    }

    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("☠️ Parse Error:", parseError)
    }

    func parser(_ parser: XMLParser, validationErrorOccurred validationError: Error) {
        print("☠️ Validation Error:", validationError)
    }
}
