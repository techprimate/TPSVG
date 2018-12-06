//
//  TPSVGNumberParser_Spec.swift
//  TPSVG_Tests
//
//  Created by Philip Niedertscheider on 06.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import Quick
import Nimble
@testable import TPSVG

// swiftlint:disable type_name function_body_length line_length

class TPSVGNumberParser_Spec: QuickSpec {

    override func spec() {
        describe("TPSVGNumberParser") {

            describe("parse value") {

                it("should parse integer number") {
                    let result = TPSVGNumberParser.parse("123")
                    expect(result).toNot(beNil())
                    expect(result?.value) == 123
                    expect(result?.unit) == ""
                }

                it("should parse positive integer number") {
                    let result = TPSVGNumberParser.parse("+123")
                    expect(result).toNot(beNil())
                    expect(result?.value) == 123
                    expect(result?.unit) == ""
                }

                it("should parse negative integer number") {
                    let result = TPSVGNumberParser.parse("-123")
                    expect(result).toNot(beNil())
                    expect(result?.value) == -123
                    expect(result?.unit) == ""
                }

                it("should parse floating point number") {
                    let result = TPSVGNumberParser.parse("1.9199219")
                    expect(result).toNot(beNil())
                    expect(result?.value) == 1.9199219
                    expect(result?.unit) == ""
                }

                it("should parse floating point number without leading zero") {
                    let result = TPSVGNumberParser.parse(".9199219")
                    expect(result).toNot(beNil())
                    expect(result?.value) == 0.9199219
                    expect(result?.unit) == ""
                }

                it("should parse negative floating point number") {
                    let result = TPSVGNumberParser.parse("1.9199219")
                    expect(result).toNot(beNil())
                    expect(result?.value) == 1.9199219
                    expect(result?.unit) == ""
                }

                it("should parse negative floating point number without zero") {
                    let result = TPSVGNumberParser.parse("-.9199219")
                    expect(result).toNot(beNil())
                    expect(result?.value) == -0.9199219
                    expect(result?.unit) == ""
                }
            }
        }
    }
}
