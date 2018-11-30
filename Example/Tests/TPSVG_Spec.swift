//
//  TPSVG_Spec.swift
//  TPSVG_Tests
//
//  Created by Philip Niedertscheider on 29.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import Quick
import Nimble
@testable import TPSVG

// swiftlint:disable type_name function_body_length

class TPSVG_Spec: QuickSpec {

    override func spec() {
        describe("TPSVG") {

            describe("initalizer") {

                it("can initialized with an url") {
                    let url = Bundle.main.url(forResource: "empty", withExtension: "svg")!
                    do {
                        let svg = try TPSVG(contentsOf: url)
                        expect(svg.raw) == "<svg></svg>\n"
                    } catch {
                        fail(error.localizedDescription)
                    }
                }

                it("cannot be initialized with an invalid url") {
                    do {
                        _ = try TPSVG(contentsOf: URL(fileURLWithPath: ""))
                        fail("Should have thrown!")
                    } catch {
                        expect(error).toNot(beNil())
                    }
                }

                it("can be initialized parse data") {
                    let url = Bundle.main.url(forResource: "empty", withExtension: "svg")!
                    do {
                        let data = try Data(contentsOf: url)
                        let svg = try TPSVG(data: data)
                        expect(svg.raw) == "<svg></svg>\n"
                    } catch {
                        fail(error.localizedDescription)
                    }
                }

                it("cannot be initialized with invalid UTF8 data") {
                    do {
                        _ = try TPSVG(data: Data(bytes: [0xAD]))
                        fail("Should have thrown!")
                    } catch TPSVGError.invalidData {
                        expect(true) == true // Success
                    } catch {
                        fail(error.localizedDescription)
                    }
                }

                it("can be initialized with raw string") {
                    do {
                        let raw = "<svg></svg>"
                        let svg = try TPSVG(raw: raw)
                        expect(svg.raw) == raw
                    } catch {
                        fail(error.localizedDescription)
                    }
                }
            }

            describe("results") {

                it("should parse raw result") {
                    let url = Bundle.main.url(forResource: "empty", withExtension: "svg")!
                    do {
                        let data = try Data(contentsOf: url)
                        let svg = try TPSVG(data: data)
                        let engine = TPSVGEngine()
                        engine.parse(data)

                        expect(svg.paths) == engine.paths
                        expect(svg.styles) == engine.styles
                    } catch {
                        fail(error.localizedDescription)
                    }
                }
            }
        }
    }
}
