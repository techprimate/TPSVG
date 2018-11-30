//
//  TPSVGEngine_Spec.swift
//  TPSVG_Tests
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

import Quick
import Nimble
@testable import TPSVG

// swiftlint:disable type_name function_body_length

class TPSVGEngine_Spec: QuickSpec {

    override func spec() {
        describe("TPSVGEngine") {

            func parse(file: String) -> TPSVGEngine {
                let url = Bundle.main.url(forResource: "empty", withExtension: "svg")!
                var data: Data!
                do {
                    data = try Data(contentsOf: url)
                } catch {
                    fail(error.localizedDescription)
                    fatalError()
                }

                let engine = TPSVGEngine()
                engine.parse(data)
                return engine
            }

            it("can parse empty data") {
                let engine = parse(file: "empty")

                expect(engine.styles) == [
                    TPSVGStyle(name: "st0", fill: UIColor.red)
                ]
                expect(engine.paths) == []
            }

            it("can parse file-1") {
                let engine = parse(file: "file-1-rect")

                expect(engine.styles) == [
                    TPSVGStyle(name: "st0", fill: UIColor.red)
                ]
                expect(engine.paths) == []
            }

            it("can parse file-2") {
                let engine = parse(file: "file-2-polygon")

                expect(engine.styles) == [
                    TPSVGStyle(name: "st0", stroke: TPSVGStroke(color: UIColor.black, width: 10, miterLimit: 10))
                ]
                expect(engine.paths) == []
            }

            it("can parse file-3") {
                let engine = parse(file: "file-3-polyline")

                expect(engine.styles) == [
                    TPSVGStyle(name: "st0", fill: UIColor.green)
                ]
                expect(engine.paths) == []
            }

            it("can parse file-4") {
                let engine = parse(file: "file-4-circle")

                expect(engine.styles) == [
                    TPSVGStyle(name: "st0", fill: UIColor.green)
                ]
                expect(engine.paths) == []
            }

            it("can parse file-5") {
                let engine = parse(file: "file-5-ellipse")

                expect(engine.styles) == [
                    TPSVGStyle(name: "st0", fill: UIColor.green)
                ]
                expect(engine.paths) == []
            }

            it("can parse file-6") {
                let engine = parse(file: "file-6-path")

                expect(engine.styles) == [
                    TPSVGStyle(name: "st0", fill: UIColor.green)
                ]
                expect(engine.paths) == []
            }

            it("can parse file-7") {
                let engine = parse(file: "file-7-text")

                expect(engine.styles) == [
                    TPSVGStyle(name: "st0", font: TPSVGFont(family: "AvenirNext-Regular")),
                    TPSVGStyle(name: "st1", font: TPSVGFont(size: 50))
                ]
                expect(engine.paths) == []
            }

            it("can parse file-8") {
                let engine = parse(file: "file-8")

                expect(engine.styles) == [
                    TPSVGStyle(name: "st0", fill: UIColor.green)
                ]
                expect(engine.paths) == []
            }

            it("can parse file-9") {
                let engine = parse(file: "file-9")

                expect(engine.styles) == [
                    TPSVGStyle(name: "st0", fill: UIColor.green)
                ]
                expect(engine.paths) == []
            }

            it("can parse file-10-tiger") {
                let engine = parse(file: "file-10-tiger")

                expect(engine.styles) == [
                    TPSVGStyle(name: "a", fill: UIColor.white, stroke: TPSVGStroke(color: UIColor.black)),
                    TPSVGStyle(name: "ar", fill: UIColor.white, stroke: TPSVGStroke(color: UIColor.black)),
                    TPSVGStyle(name: "b", fill: UIColor.white),
                    TPSVGStyle(name: "o", fill: UIColor.white),

                    TPSVGStyle(name: "a", fill: UIColor.white),

                    TPSVStyle(name: "ar"),
                    TPSVStyle(name: "ar"),
                    TPSVStyle(name: "ar"),
                    TPSVStyle(name: "ar"),
                    TPSVStyle(name: "ar"),
                    TPSVStyle(name: "ar"),
                    TPSVStyle(name: "ar"),
                    TPSVStyle(name: "ar"),
                    TPSVStyle(name: "ar"),
                    TPSVStyle(name: "ao"),
                    TPSVStyle(name: "ap"),
                    TPSVStyle(name: "aq"),
                    TPSVStyle(name: "ar")
                ]
                expect(engine.paths) == []
            }
        }
    }
}
