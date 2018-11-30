//
//  TPCSSEngine_Spec.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import Quick
import Nimble
@testable import TPSVG

// swiftlint:disable type_name function_body_length

class TPCSSEngine_Spec: QuickSpec {

    override func spec() {
        describe("TPCSSEngine") {

            func read(file: String) -> String {
                let url = Bundle.main.url(forResource: file, withExtension: "css")!
                do {
                    return try String(contentsOf: url)
                } catch {
                    fail(error.localizedDescription)
                    fatalError()
                }
            }

            it("should parse css text") {
                let engine = TPCSSEngine()
                engine.text = read(file: "file-1")
                let styles = engine.parse()

                expect(styles) == [
                    TPSVGStyle(name: "a", fill: UIColor(hex: "#fff")),
                    TPSVGStyle(name: "b", fill: UIColor(hex: 0xcc7226)),
                    TPSVGStyle(name: "d", fill: UIColor(hex: 0xcc7226)),
                    TPSVGStyle(name: "e", fill: UIColor(hex: 0xe87f3a)),
                    TPSVGStyle(name: "f", fill: UIColor(hex: 0xea8c4d)),
                    TPSVGStyle(name: "g", fill: UIColor(hex: 0xec9961)),
                    TPSVGStyle(name: "h", fill: UIColor(hex: 0xeea575)),
                    TPSVGStyle(name: "i", fill: UIColor(hex: 0xf1b288))
                ]
            }
        }
    }
}
