//
//  TPSVGValueLexer_Spec.swift
//  TPSVG_Tests
//
//  Created by Philip Niedertscheider on 05.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import Quick
import Nimble
@testable import TPSVG

class TPSVGValueLexer_Spec: QuickSpec {

    override func spec() {
        describe("TPSVGValueLexer_Spec") {

            describe("initalize") {

                it("should parse minifed values") {
                    let raw = "-2.46.4-4.9.86-7.32,1.41"
                    expect(TPSVGValueLexer.parseValues(from: raw)) == [-2.46, 0.4, -4.9, 0.86, -7.32, 1.41]
                }

                it("should parse space values") {
                    let raw = "123.456 654.321 123.123 567.567 876.876 465.465"
                    expect(TPSVGValueLexer.parseValues(from: raw)) == [123.456, 654.321, 123.123, 567.567, 876.876, 465.465]
                }

                it("should read space separated float values") {
                    let raw = "0 832.5 63.5 896 511.5 448 63.5 0 0 63.5 384.5 448 0 832.5"
                    expect(TPSVGValueLexer.parseValues(from: raw)) == [0, 832.5, 63.5, 896, 511.5, 448, 63.5, 0, 0, 63.5, 384.5, 448, 0, 832.5]
                }

                it("should read comma separated integer values") {
                    let raw = "325,120 175,120 100,250 175,380 325,380 400,250"
                    expect(TPSVGValueLexer.parseValues(from: raw)) == [325, 120, 175, 120, 100, 250, 175, 380, 325, 380, 400, 250]
                }

                it("should parse space separated values") {
                    let raw = " 0 7.5 "
                }
            }
        }
    }
}
