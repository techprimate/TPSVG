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

    func parser(_ parser: XMLParser, foundNotationDeclarationWithName name: String, publicID: String?, systemID: String?) {
        print("Notation Declaration: ", name, publicID as Any, systemID as Any)
    }

    func parser(_ parser: XMLParser, foundUnparsedEntityDeclarationWithName name: String,
                publicID: String?, systemID: String?, notationName: String?) {
        print("Unparsed Entity Declaration: ", name, publicID as Any, systemID as Any, notationName as Any)
    }

    func parser(_ parser: XMLParser, foundAttributeDeclarationWithName attributeName: String,
                forElement elementName: String, type: String?, defaultValue: String?) {
        print("Attribute Declaration: ", attributeName, elementName, type as Any, defaultValue as Any)
    }

    func parser(_ parser: XMLParser, foundElementDeclarationWithName elementName: String, model: String) {
        print("Element Declaration: ", elementName, model)
    }

    func parser(_ parser: XMLParser, foundInternalEntityDeclarationWithName name: String, value: String?) {
        print("Internal Entity Declaration: ", name, value as Any)
    }

    func parser(_ parser: XMLParser, foundExternalEntityDeclarationWithName name: String, publicID: String?, systemID: String?) {
        print("External Entity Declaration: ", name, publicID as Any, systemID as Any)
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?,
                qualifiedName qName: String?, attributes attributeDict: [String: String] = [:]) {
        print("Start Element: ", elementName, namespaceURI as Any, qName as Any, attributeDict)
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("End Element: ", elementName, namespaceURI as Any, qName as Any)
    }

    func parser(_ parser: XMLParser, didStartMappingPrefix prefix: String, toURI namespaceURI: String) {
        print("Start Mapping Prefix: ", prefix, namespaceURI)
    }

    func parser(_ parser: XMLParser, didEndMappingPrefix prefix: String) {
        print("End Mapping Prefix: ", prefix)
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        print("Found characters: ", string)
    }

    func parser(_ parser: XMLParser, foundIgnorableWhitespace whitespaceString: String) {
        print("Found ignoreable whitespace: ", whitespaceString)
    }

    func parser(_ parser: XMLParser, foundProcessingInstructionWithTarget target: String, data: String?) {
        print("Processing Instruction: ", target, data as Any)
    }

    func parser(_ parser: XMLParser, foundComment comment: String) {
        print("Comment: ", comment)
    }

    func parser(_ parser: XMLParser, foundCDATA CDATABlock: Data) {
        print("CDATA: ", CDATABlock)
    }

    func parser(_ parser: XMLParser, resolveExternalEntityName name: String, systemID: String?) -> Data? {
        print("Resolve: ", name)
        return nil
    }

    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("Parse Error: ", parseError)
    }

    func parser(_ parser: XMLParser, validationErrorOccurred validationError: Error) {
        print("Validation Error: ", validationError)
    }
}
