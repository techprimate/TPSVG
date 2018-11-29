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

// swiftlint:disable type_name

class TPSVG_Spec: QuickSpec {

    override func spec() {
        describe("TPSVG") {

            describe("initalizer") {

                it("can initialized with an url") {
                    let url = Bundle.main.url(forResource: "empty", withExtension: "svg")!
                    do {
                        let svg = try TPSVG(contentsOf: url)
                        expect(svg.raw).to(equal("<svg></svg>\n"))
                    } catch {
                        fail(error.localizedDescription)
                    }
                }

                it("can not be initialized with an invalid url") {
                    do {
                        _ = try TPSVG(contentsOf: URL(fileURLWithPath: ""))
                        fail("Should have failed!")
                    } catch {
                        expect(error).toNot(beNil())
                    }
                }

                it("can be initialized parse data") {
                    let url = Bundle.main.url(forResource: "empty", withExtension: "svg")!
                    do {
                        let data = try Data(contentsOf: url)
                        let svg = try TPSVG(data: data)
                        expect(svg.raw).to(equal("<svg></svg>\n"))
                    } catch {
                        fail(error.localizedDescription)
                    }
                }

                it("can not be initialized with invalid UTF8 data") {
                    do {
                        _ = try TPSVG(data: Data(bytes: [0xAD]))
                        fail("Should have thrown!")
                    } catch TPSVGError.invalidData {
                        expect(true).to(beTrue()) // Success
                    } catch {
                        fail(error.localizedDescription)
                    }
                }

                it("can be initialized with raw string") {
                    let raw = "<svg></svg>"
                    let svg = TPSVG(raw: raw)
                    expect(svg.raw).to(equal(raw))
                }
            }
        }
    }
}
