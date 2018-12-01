//
//  TPSVGPathDLexer_Spec.swift
//  TPSVG_Tests
//
//  Created by Philip Niedertscheider on 01.12.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import Quick
import Nimble
@testable import TPSVG

// swiftlint:disable type_name function_body_length

class TPSVGPathDLexer_Spec: QuickSpec {

    override func spec() {
        describe("TPSVGPathDLexer") {

            describe("initalizer") {

                describe("moveTo") {

                    it("should parse") {
                        let raw = "M 90 260"
                        let instructions = TPSVGPathDLexer(raw: raw).parse()

                        expect(instructions).to(haveCount(1))
                        expect(instructions[0]) == TPSVGInstrMoveTo(point: CGPoint(x: 90, y: 260))
                    }

                    it("should parse with floating values") {
                        let raw = "M 90.12352 260.125123"
                        let instructions = TPSVGPathDLexer(raw: raw).parse()

                        expect(instructions).to(haveCount(1))
                        expect(instructions[0]) == TPSVGInstrMoveTo(point: CGPoint(x: 90.12352, y: 260.125123))
                    }

                    it("should parse relative") {
                        let raw = "m 90 260"
                        let instructions = TPSVGPathDLexer(raw: raw).parse()

                        expect(instructions).to(haveCount(1))
                        expect(instructions[0]) == TPSVGInstrMoveTo(point: CGPoint(x: 90, y: 260), relative: true)
                    }

                    it("should parse partly minified moveTo") {
                        let raw = "M 90,260"
                        let instructions = TPSVGPathDLexer(raw: raw).parse()

                        expect(instructions).to(haveCount(1))
                        expect(instructions[0]) == TPSVGInstrMoveTo(point: CGPoint(x: 90, y: 260))
                    }

                    it("should parse minified moveTo") {
                        let raw = "M90,260"
                        let instructions = TPSVGPathDLexer(raw: raw).parse()

                        expect(instructions).to(haveCount(1))
                        expect(instructions[0]) == TPSVGInstrMoveTo(point: CGPoint(x: 90, y: 260))
                    }
                }

                describe("cubic curve") {

                    it("should parse") {
                        let raw = "C100 100 250 100 250 200"
                        let instructions = TPSVGPathDLexer(raw: raw).parse()

                        expect(instructions).to(haveCount(1))
                        expect(instructions[0]) == TPSVGInstrCubicCurve(end: CGPoint(x: 100, y: 100),
                                                                        control1: CGPoint(x: 250, y: 100),
                                                                        control2: CGPoint(x: 250, y: 200))
                    }

                    it("should parse with floating values") {
                        let raw = "C123.456 654.321 123.123 567.567 876.876 465.465"
                        let instructions = TPSVGPathDLexer(raw: raw).parse()

                        expect(instructions).to(haveCount(1))
                        expect(instructions[0]) == TPSVGInstrCubicCurve(end: CGPoint(x: 123.456, y: 654.321),
                                                                        control1: CGPoint(x: 123.123, y: 567.567),
                                                                        control2: CGPoint(x: 876.876, y: 465.465))
                    }

                    it("should parse relative") {
                        let raw = "c100 100 250 100 250 200"
                        let instructions = TPSVGPathDLexer(raw: raw).parse()

                        expect(instructions).to(haveCount(1))
                        expect(instructions[0]) == TPSVGInstrCubicCurve(end: CGPoint(x: 100, y: 100),
                                                                        control1: CGPoint(x: 250, y: 100),
                                                                        control2: CGPoint(x: 250, y: 200),
                                                                        relative: true)
                    }

                    it("should parse partly minified moveTo") {
                        let raw = "C100,100 250,100 250,200"
                        let instructions = TPSVGPathDLexer(raw: raw).parse()

                        expect(instructions).to(haveCount(1))
                        expect(instructions[0]) == TPSVGInstrCubicCurve(end: CGPoint(x: 100, y: 100),
                                                                        control1: CGPoint(x: 250, y: 100),
                                                                        control2: CGPoint(x: 250, y: 200))
                    }

                    it("should parse minified moveTo") {
                        let raw = "C100,100,250,100,250,200"
                        let instructions = TPSVGPathDLexer(raw: raw).parse()

                        expect(instructions).to(haveCount(1))
                        expect(instructions[0]) == TPSVGInstrCubicCurve(end: CGPoint(x: 100, y: 100),
                                                                        control1: CGPoint(x: 250, y: 100),
                                                                        control2: CGPoint(x: 250, y: 200))
                    }
                }

                describe("cubic curve") {

                    it("should parse") {
                        let raw = "C100 100 250 100 250 200"
                        let instructions = TPSVGPathDLexer(raw: raw).parse()

                        expect(instructions).to(haveCount(1))
                        expect(instructions[0]) == TPSVGInstrCubicCurve(end: CGPoint(x: 100, y: 100),
                                                                        control1: CGPoint(x: 250, y: 100),
                                                                        control2: CGPoint(x: 250, y: 200))
                    }

                    it("should parse with floating values") {
                        let raw = "C123.456 654.321 123.123 567.567 876.876 465.465"
                        let instructions = TPSVGPathDLexer(raw: raw).parse()

                        expect(instructions).to(haveCount(1))
                        expect(instructions[0]) == TPSVGInstrCubicCurve(end: CGPoint(x: 123.456, y: 654.321),
                                                                        control1: CGPoint(x: 123.123, y: 567.567),
                                                                        control2: CGPoint(x: 876.876, y: 465.465))
                    }

                    it("should parse relative") {
                        let raw = "c100 100 250 100 250 200"
                        let instructions = TPSVGPathDLexer(raw: raw).parse()

                        expect(instructions).to(haveCount(1))
                        expect(instructions[0]) == TPSVGInstrCubicCurve(end: CGPoint(x: 100, y: 100),
                                                                        control1: CGPoint(x: 250, y: 100),
                                                                        control2: CGPoint(x: 250, y: 200),
                                                                        relative: true)
                    }

                    it("should parse partly minified moveTo") {
                        let raw = "C100,100 250,100 250,200"
                        let instructions = TPSVGPathDLexer(raw: raw).parse()

                        expect(instructions).to(haveCount(1))
                        expect(instructions[0]) == TPSVGInstrCubicCurve(end: CGPoint(x: 100, y: 100),
                                                                        control1: CGPoint(x: 250, y: 100),
                                                                        control2: CGPoint(x: 250, y: 200))
                    }

                    it("should parse minified moveTo") {
                        let raw = "C100,100,250,100,250,200"
                        let instructions = TPSVGPathDLexer(raw: raw).parse()

                        expect(instructions).to(haveCount(1))
                        expect(instructions[0]) == TPSVGInstrCubicCurve(end: CGPoint(x: 100, y: 100),
                                                                        control1: CGPoint(x: 250, y: 100),
                                                                        control2: CGPoint(x: 250, y: 200))
                    }
                }
            }
        }
    }
}
